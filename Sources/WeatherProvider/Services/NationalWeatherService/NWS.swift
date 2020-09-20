import Foundation
import GeohashKit
import NationalWeatherService

class WXPNationalWeatherService: WXPProvider {
    let nws: NationalWeatherService

    public static var name: String { "National Weather Service" }

    required init() {
        nws = NationalWeatherService(userAgent: ProcessInfo.processInfo.environment["NWS_USER_AGENT"]!)
    }

    public func getCurrentConditions(for location: Location, then handler: @escaping (Result<WXPForecastPeriod, WXPError>) -> Void) {
        nws.currentCondition(latitude: location.latitude, longitude: location.longitude) { result in
            switch result {
            case .success(let forecast):
                handler(.success(forecast))
            case .failure(let error):
                if case NationalWeatherService.APIError.invalidPoint(_) = error {
                    handler(.failure(.noDataAvailable))
                } else {
                    handler(.failure(.other(error)))
                }
            }
        }
    }

    public func getForecast(for location: Location, at time: Date, then handler: @escaping (Result<WXPForecast, WXPError>) -> Void) {
        // No support for forecast yet.
        if time >= Date() {
            handler(.failure(.futureDataUnavailable))
        } else {
            handler(.failure(.historicalDataUnavailable))
        }
    }
}

extension Forecast: WXPForecast {
    public var wxpPeriods: [WXPForecastPeriod] {
        return self.periods
    }

    public var updatedAt: Date {
        return generatedAt
    }
}

extension Forecast.Period: WXPForecastPeriod {
    public var wxpWind: WXPWind? {
        switch windSpeed {
        case .single(let speed, let direction):
            guard let direction = WXPWindDirection(rawValue: direction.rawValue) else { return nil }
            return WXPWind.single(speed, direction: direction)
        case .range(let lhsSpeed, let rhsSpeed, let direction):
            guard let direction = WXPWindDirection(rawValue: direction.rawValue) else { return nil }
            return WXPWind.range(lhs: lhsSpeed, rhs: rhsSpeed, direction: direction)
        }
    }

    public var applicableTime: DateInterval {
        return date
    }

    public var forecast: String? {
        return shortForecast
    }
}
