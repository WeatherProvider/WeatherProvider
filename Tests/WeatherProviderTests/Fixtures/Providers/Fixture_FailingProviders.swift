import Foundation
import GeohashKit
@testable import WeatherProvider

extension Fixtures {
    class FailingWeatherProvider: WeatherProvider {
        override public var providers: [WXPProvider.Type] {
            return [USAFailingWeatherProvider.self, CanadaFailingWeatherProvider.self]
        }
    }

    class USAFailingWeatherProvider: USAWeatherProvider {
        override public func getCurrentConditions(for location: Location, then handler: @escaping (Result<WXPForecastPeriod, WXPError>) -> Void) {
            handler(.failure(.noDataAvailable))
        }

        override public func getForecast(for location: Location, at time: Date, then handler: @escaping (Result<WXPForecast, WXPError>) -> Void) {
            handler(.failure(.noDataAvailable))
        }
    }

    class CanadaFailingWeatherProvider: CanadaWeatherProvider {
        override public func getCurrentConditions(for location: Location, then handler: @escaping (Result<WXPForecastPeriod, WXPError>) -> Void) {
            handler(.failure(.noDataAvailable))
        }

        override public func getForecast(for location: Location, at time: Date, then handler: @escaping (Result<WXPForecast, WXPError>) -> Void) {
            handler(.failure(.noDataAvailable))
        }
    }
}
