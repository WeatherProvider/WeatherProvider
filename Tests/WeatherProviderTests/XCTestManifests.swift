import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(WeatherProviderTests.allTests),
        testCase(WeatherProviderIntegrationTests.allTests)
    ]
}
#endif
