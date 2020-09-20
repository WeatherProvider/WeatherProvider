import XCTest
import WeatherProviderTests

var tests = [XCTestCaseEntry]()
tests += WeatherProviderTests.allTests()
tests += WeatherProviderIntegrationTests.allTests()
XCTMain(tests)
