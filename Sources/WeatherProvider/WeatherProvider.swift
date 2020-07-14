import Foundation

public protocol WeatherProvider {
    typealias ForecastHandler = (Result<Forecast, Error>) -> Void
    var name: String { get }

    func getForecast(for location: Location,
                     at time: Date,
                     then handler: ForecastHandler)
}
