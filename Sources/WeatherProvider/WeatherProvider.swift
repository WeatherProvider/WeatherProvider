import Foundation
import GeohashKit
import NationalWeatherService

public struct WeatherProvider: WXPProvider {
    public static var providers: [WXPProvider.Type] = [
        NationalWeatherService.self
    ]

    public static var region: Set<Geohash.Hash> = {
        let flattenedRegions = WeatherProvider.providers.flatMap {
            $0.region
        }

        return Set<Geohash.Hash>(flattenedRegions)
    }()

    public static var name: String { "Weather Provider" }

    public init() { }

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

    func bestAvailableProvider(for location: Location) -> WXPProvider.Type? {
//        let geoHash = 
        return nil
    }
}
