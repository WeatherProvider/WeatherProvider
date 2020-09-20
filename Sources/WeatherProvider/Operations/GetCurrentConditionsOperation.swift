import Foundation
import GeohashKit

class GetWeatherRecord {
    var geohash: Geohash
    var provider: WXPProvider.Type

    init(geohash: Geohash, provider: WXPProvider.Type) {
        self.geohash = geohash
        self.provider = provider
    }
}

class GetCurrentConditions: GetWeatherOperation<WXPForecastPeriod> {
    var record: GetWeatherRecord

    init(record: GetWeatherRecord) {
        self.record = record
    }

    override func start() {
        super.start()

        record.provider.init().getCurrentConditions(for: record.geohash) { result in
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
