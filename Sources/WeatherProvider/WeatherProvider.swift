import Foundation
import GeohashKit

public protocol WeatherProvider {
    typealias ForecastPeriodHandler = (Result<WXPForecastPeriod, WXPError>) -> Void
    typealias ForecastHandler = (Result<WXPForecast, WXPError>) -> Void
    var name: String { get }

    init()

    func getCurrentConditions(for location: Location,
                              then handler: @escaping ForecastPeriodHandler)

    func getForecast(for location: Location,
                     at time: Date,
                     then handler: @escaping ForecastHandler)
}
