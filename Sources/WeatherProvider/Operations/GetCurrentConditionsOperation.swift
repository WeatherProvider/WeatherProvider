import Foundation
import GeohashKit

class GetCurrentConditions: GetWeatherOperation<WXPForecastPeriod> {
    var record: GetWeatherRecord

    init(record: GetWeatherRecord) {
        self.record = record
    }

    override func start() {
        super.start()

        record.provider.init().getCurrentConditions(for: record.location) { result in
            guard !self.isCancelled else { return }
            self.set(result: result)
            self.finish()
        }
    }

    func set(result: Result<WXPForecastPeriod, WXPError>) {
        self.result = result

        if case let .failure(error) = result {
            self.error = error
        }
    }
}
