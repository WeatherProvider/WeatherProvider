import Foundation
import GeohashKit
@testable import WeatherProvider

extension Fixtures {
    class USAWeatherProvider: WXPProvider {
        public static var region: Set<Geohash.Hash> {
            return Fixtures.USARegion
        }

        static var trie: Trie = {
            let trie = Trie()
            region.forEach { trie.insert(word: $0) }
            return trie
        }()

        public static var name: String { "United States of America" }

        required init() { }

        public func getCurrentConditions(for location: Location, then handler: @escaping (Result<WXPForecastPeriod, WXPError>) -> Void) {
            handler(.success(Fixtures.GenericUSAForecastPeriod))
        }

        public func getForecast(for location: Location, at time: Date, then handler: @escaping (Result<WXPForecast, WXPError>) -> Void) {
            fatalError()
        }
    }

    class CanadaWeatherProvider: WXPProvider {
        public static var region: Set<Geohash.Hash> {
            return Fixtures.CanadaRegion
        }

        static var trie: Trie = {
            let trie = Trie()
            region.forEach { trie.insert(word: $0) }
            return trie
        }()

        public static var name: String { "Canananada" }

        required init() { }

        public func getCurrentConditions(for location: Location, then handler: @escaping (Result<WXPForecastPeriod, WXPError>) -> Void) {
            handler(.success(Fixtures.GenericCanadaForecastPeriod))
        }

        public func getForecast(for location: Location, at time: Date, then handler: @escaping (Result<WXPForecast, WXPError>) -> Void) {
            fatalError()
        }
    }
}
