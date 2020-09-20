import Foundation
import GeohashKit

class WeatherProvider: WXPProvider {
    public static let GeohashPrecision: Int = 6

    // MARK: - WXPProvider properties
    public static var providers: [WXPProvider.Type] = [
        WXPNationalWeatherService.self
    ]

    static var trie: Trie = {
        let trie = Trie()
        region.forEach { trie.insert(word: $0) }
        return trie
    }()

    public static var region: Set<Geohash.Hash> = {
        let flattenedRegions = WeatherProvider.providers.flatMap {
            $0.region
        }

        return Set<Geohash.Hash>(flattenedRegions)
    }()

    public static var name: String { "Weather Provider" }

    var operationQueue: OperationQueue = OperationQueue()
    
    required init() { }

    public func getCurrentConditions(for location: Location, then handler: @escaping ForecastPeriodHandler) {
        guard let providers = WeatherProvider.bestAvailableProvider(for: location) else {
            handler(.failure(.noDataAvailable))
            return
        }

        let operations: [GetCurrentConditions] = providers.providers.compactMap { provider in
            guard let geohash = Geohash(geohash: provider.key) else { return nil }
            return GetCurrentConditions(record: GetWeatherRecord(geohash: geohash, provider: provider.value))
        }

        let operation = GetWeather(operations: operations)
        operation.completionBlock = {
            handler(operation.result ?? .failure(.noDataAvailable))
        }
        operationQueue.addOperation(operation)
    }

    public func getForecast(for location: Location, at time: Date, then handler: @escaping ForecastHandler) {
        handler(.failure(.noDataAvailable))
    }

    static func bestAvailableProvider(for location: Location) -> BestAvailableProviders? {
        let geohash: Geohash
        if let hash = location as? Geohash {
            geohash = hash
        } else {
            guard let hash = Geohash(coordinates: (location.latitude, location.longitude), precision: WeatherProvider.GeohashPrecision) else {
                return nil
            }
            geohash = hash
        }

        return BestAvailableProviders(geohash: geohash.geohash, providers: WeatherProvider.providers)
    }
}
