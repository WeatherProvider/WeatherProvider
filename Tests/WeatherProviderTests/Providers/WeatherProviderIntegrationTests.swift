import XCTest
import GeohashKit
@testable import WeatherProvider

/// `WeatherProviderIntegrationTests`
///
/// This is responsible for making sure that:
///   - `operationsForCurrentCondition` is prioritizing providers correctly.
///   - Failing providers are handled gracefully.
final class WeatherProviderIntegrationTests: XCTestCase {
    /// USA is a failing source here, potentially because of HTTP 500, so it should try the next best provider, Canada.
    func testFailing() {
        let location = Geohash(geohash: "cbejbv")!

        let records = [
            GetWeatherRecord(geohash: Geohash(geohash: "cbe")!, provider: Fixtures.USAFailingWeatherProvider.self, location: location),
            GetWeatherRecord(geohash: Geohash(geohash: "c")!, provider: Fixtures.CanadaWeatherProvider.self, location: location)
        ]

        let operation = WeatherProvider().operationForCurrentConditions(records: records)

        XCTAssertEqual(operation.queue.count, 2)
        XCTAssertEqual((operation.queue[0] as! GetCurrentConditions).record.provider.name, Fixtures.USAFailingWeatherProvider.name)
        XCTAssertEqual((operation.queue[1] as! GetCurrentConditions).record.provider.name, Fixtures.CanadaWeatherProvider.name)

        operation.start()
        operation.waitUntilFinished()

        XCTAssertSuccess(operation.result!)
        guard case let .success(forecast) = operation.result! else {
            XCTFail()
            return
        }

        XCTAssertEqual(forecast.applicableTime, Fixtures.GenericCanadaForecastPeriod.applicableTime)
        XCTAssertEqual(forecast.temperature, Fixtures.GenericCanadaForecastPeriod.temperature)
        XCTAssertEqual(forecast.wxpWind, Fixtures.GenericCanadaForecastPeriod.wxpWind)
        XCTAssertEqual(forecast.forecast, Fixtures.GenericCanadaForecastPeriod.forecast)
        XCTAssertEqual(forecast.detailedForecast, Fixtures.GenericCanadaForecastPeriod.detailedForecast)
    }

    /// USA is a successful source here, so the data should originate from USA.
    func testSuccessful() {
        let location = Geohash(geohash: "cbejbv")!

        let records = [
            GetWeatherRecord(geohash: Geohash(geohash: "cbe")!, provider: Fixtures.USAWeatherProvider.self, location: location),
            GetWeatherRecord(geohash: Geohash(geohash: "c")!, provider: Fixtures.CanadaWeatherProvider.self, location: location)
        ]

        let operation = WeatherProvider().operationForCurrentConditions(records: records)

        XCTAssertEqual(operation.queue.count, 2)
        XCTAssertEqual((operation.queue[0] as! GetCurrentConditions).record.provider.name, Fixtures.USAWeatherProvider.name)
        XCTAssertEqual((operation.queue[1] as! GetCurrentConditions).record.provider.name, Fixtures.CanadaWeatherProvider.name)

        operation.start()
        operation.waitUntilFinished()

        XCTAssertSuccess(operation.result!)
        guard case let .success(forecast) = operation.result! else {
            XCTFail()
            return
        }

        XCTAssertEqual(forecast.applicableTime, Fixtures.GenericUSAForecastPeriod.applicableTime)
        XCTAssertEqual(forecast.temperature, Fixtures.GenericUSAForecastPeriod.temperature)
        XCTAssertEqual(forecast.wxpWind, Fixtures.GenericUSAForecastPeriod.wxpWind)
        XCTAssertEqual(forecast.forecast, Fixtures.GenericUSAForecastPeriod.forecast)
        XCTAssertEqual(forecast.detailedForecast, Fixtures.GenericUSAForecastPeriod.detailedForecast)
    }
}
