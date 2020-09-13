import Foundation
import GeohashKit

public protocol WXPProvider {
    typealias ForecastPeriodHandler = (Result<WXPForecastPeriod, WXPError>) -> Void
    typealias ForecastHandler = (Result<WXPForecast, WXPError>) -> Void

    static var region: Set<Geohash.Hash> { get }
    static var name: String { get }

    init()

    func getCurrentConditions(for location: Location,
                              then handler: @escaping ForecastPeriodHandler)

    func getForecast(for location: Location,
                     at time: Date,
                     then handler: @escaping ForecastHandler)
}
