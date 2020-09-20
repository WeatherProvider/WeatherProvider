import Foundation
import GeohashKit
import MeteorologicalServiceOfCanada

class WXPMeteorologicalServiceOfCanada: WXPProvider {
    let msc = MeteorologicalServiceOfCanada()

    public static var name: String { "Meteorological Service Of Canada" }

    required init() { }

    public func getCurrentConditions(for location: Location, then handler: @escaping ForecastPeriodHandler) {
        msc.getCurrentConditions(at: (location.latitude, location.longitude)) { result in
            switch result {
            case .success(let conditions): handler(.success(conditions))
            case .failure(let error): handler(.failure(.other(error)))
            }
        }
    }

    public func getForecast(for location: Location, at time: Date, then handler: @escaping ForecastHandler) {
        // No support for forecast yet.
        if time >= Date() {
            handler(.failure(.futureDataUnavailable))
        } else {
            handler(.failure(.historicalDataUnavailable))
        }
    }
}

extension CurrentConditions: WXPForecastPeriod {
    public var applicableTime: DateInterval {
        guard let date = self.dateTime.date else {
            return DateInterval(start: Date(), duration: 60 * 60)
        }

        return DateInterval(start: date, duration: 60 * 60)
    }

    public var wxpWind: WXPWind? {
        return self.wind.wxpWind
    }

    public var forecast: String? {
        return nil
    }

    public var detailedForecast: String? {
        return nil
    }
}

extension Wind {
    var wxpWind: WXPWind? {
        guard let direction = WXPWindDirection(rawValue: self.direction.lowercased()) else { return nil }

        return WXPWind.single(self.speed, direction: direction)
    }
}
