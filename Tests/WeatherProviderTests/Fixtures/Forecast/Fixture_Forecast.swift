import Foundation
@testable import WeatherProvider

extension Fixtures {
    struct ForecastPeriod: WXPForecastPeriod {
        var applicableTime: DateInterval
        var temperature: Measurement<UnitTemperature>
        var wxpWind: WXPWind?

        var wxpCondition: WXPCondition?

        var forecast: String?
        var detailedForecast: String?
    }

    /// Taken 2020-09-20T12:00:00-07:00 for Bellevue, WA.
    public static var GenericUSAForecastPeriod: WXPForecastPeriod {
        let dateInterval = DateInterval(start: Date(timeIntervalSinceReferenceDate: 622317600), end: Date(timeIntervalSinceReferenceDate: 622342800))
        return ForecastPeriod(applicableTime: dateInterval,
                              temperature: .init(value: 19.0, unit: .celsius),
                              wxpWind: .single(.init(value: 11, unit: .kilometersPerHour), direction: .nnw),
                              wxpCondition: .clear_day,
                              forecast: "Mostly Sunny",
                              detailedForecast: "Mostly sunny. High near 19, with temperatures falling to around 16 in the afternoon. North northwest wind around 11 km/h.")
    }

    /// Taken 2020-09-10T10:09:00-07:00 for Stanley Park, Vancouver, BC
    public static var GenericCanadaForecastPeriod: WXPForecastPeriod {
        let date = ISO8601DateFormatter().date(from: "2020-09-10T10:09:00-07:00")!
        let dateInterval = DateInterval(start: date, duration: 60 * 60)

        return ForecastPeriod(applicableTime: dateInterval,
                              temperature: .init(value: 16.2, unit: .celsius),
                              wxpWind: .single(.init(value: 4, unit: .kilometersPerHour), direction: .ese),
                              wxpCondition: .clear_day,
                              forecast: nil,
                              detailedForecast: nil)
    }
}
