//
//  NWS.swift
//  
//
//  Created by Alan Chu on 8/4/20.
//

import Foundation
import GeohashKit
import NationalWeatherService

extension NationalWeatherService: WeatherProvider {
    public var name: String { "National Weather Service" }

    public var region: Set<Geohash.Hash> {
        return [
            // Lower 48
            "c0",
            "c2",
            "c8",
            "cb",
            "f0",
            "f2",
            "f8",
            "9p",
            "9r",
            "9x",
            "9z",
            "dp",
            "dr",
            "9n",
            "9q",
            "9w",
            "9y",
            "dn",
            "dq",
            "9m",
            "9t",
            "9v",
            "dj",
            "9u",
            "dh",

            // Alaska
            "bk",
            "bs",
            "bu",
            "b5",
            "b7",
            "be",
            "bg",
            "b6",
            "bd",
            "bf",
            "c4",
            "c1",
            "zc",
            "b1",
            "b3",

            // Hawaii
            "87",
            "8e"
        ]
    }

    public init() {
        guard let userAgent = ProcessInfo.processInfo.environment["NWS_USER_AGENT"] else {
            preconditionFailure("Missing \"NWS_USER_AGENT\" environment variable")
        }

        self.init(userAgent: userAgent)
    }

    public func getCurrentConditions(for location: Location, then handler: @escaping (Result<WXPForecastPeriod, WXPError>) -> Void) {
        self.currentCondition(latitude: location.latitude, longitude: location.longitude) { result in
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
