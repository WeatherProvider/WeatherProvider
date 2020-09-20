import XCTest
@testable import WeatherProvider

final class WeatherProviderTests: XCTestCase {
    func testBestAvailableProvider() {
        let providers: [WXPProvider.Type] = [
            Fixture_USAWeatherProvider.self,
            Fixture_CanadaWeatherProvider.self
        ]

        let hash = "cbejbv"
        let bestAvailable = BestAvailableProviders(geohash: hash, providers: providers)

        XCTAssertEqual(bestAvailable?.providers.count, 2)
        XCTAssertEqual(bestAvailable?.providers[0].key, "cbe")
        XCTAssertEqual(bestAvailable?.providers[0].value.name, Fixture_USAWeatherProvider.name)

        XCTAssertEqual(bestAvailable?.providers[1].key, "c")
        XCTAssertEqual(bestAvailable?.providers[1].value.name, Fixture_CanadaWeatherProvider.name)

        // Stanley Park is close to the border, which makes this a good case to test.
        let stanleyPark = "c2b2mz8"
        let bestAvailableShouldBeCanada = BestAvailableProviders(geohash: stanleyPark, providers: providers)
        XCTAssertEqual(bestAvailableShouldBeCanada?.providers.count, 1)
        XCTAssertEqual(bestAvailableShouldBeCanada?.providers[0].key, "c")
        XCTAssertEqual(bestAvailableShouldBeCanada?.providers[0].value.name, Fixture_CanadaWeatherProvider.name)

        let longBeach = "9q5bp3"
        let bestAvailableShouldBeUSA = BestAvailableProviders(geohash: longBeach, providers: providers)
        XCTAssertEqual(bestAvailableShouldBeUSA?.providers.count, 1)
        XCTAssertEqual(bestAvailableShouldBeUSA?.providers[0].key, "9q")
        XCTAssertEqual(bestAvailableShouldBeUSA?.providers[0].value.name, Fixture_USAWeatherProvider.name)
    }

    func testMeasureBestAvailableProvider() {
        let providers: [WXPProvider.Type] = [
            Fixture_USAWeatherProvider.self,
            Fixture_CanadaWeatherProvider.self
        ]

        let hash = "cbejbv"

        measure {
            _ = BestAvailableProviders(geohash: hash, providers: providers)
        }
    }

    static var allTests = [
        ("testBestAvailableProvider", testBestAvailableProvider),
        ("testMeasureBestAvailableProvider", testMeasureBestAvailableProvider)
    ]
}
