import Foundation
import GeohashKit
import NationalWeatherService

class WeatherProvider: WXPProvider {
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

    required public init() { }

    public func getCurrentConditions(for location: Location, then handler: @escaping ForecastPeriodHandler) {
        guard let provider = bestAvailableProvider(for: location) else {
            handler(.failure(.noDataAvailable))
            return
        }
    }

    public func getForecast(for location: Location, at time: Date, then handler: @escaping ForecastHandler) {
        guard let provider = bestAvailableProvider(for: location) else {
            handler(.failure(.noDataAvailable))
            return
        }
    }

    // The automagical part of this whole thing
    func bestAvailableProvider(for location: Location) -> WXPProvider.Type? {
        guard let mostPreciseHash = WeatherProvider.region.sorted().last else { return nil }
        guard let geohash = Geohash(coordinates: (location.latitude, location.longitude), precision: mostPreciseHash.count) else { return nil }

        let truncated = geohash.geohash.prefix(mostPreciseHash.count)
        let potential = WeatherProvider.region.filter { geohash.geohash.hasPrefix($0) }
        return nil
    }
}
