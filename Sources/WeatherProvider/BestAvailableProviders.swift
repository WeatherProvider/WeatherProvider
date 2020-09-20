import GeohashKit

struct BestAvailableProviders {
    var providers: [Dictionary<Geohash.Hash, WXPProvider.Type>.Element]//[(geohash: Geohash.Hash, provider: WXPProvider.Type)]

    init?(geohash hash: Geohash.Hash, providers: [WXPProvider.Type]) {
        var results: [Geohash.Hash: WXPProvider.Type] = [:]

        // Truncate the hash to match the most precise region. This is so we don't
        // unnecessarily iterate over unmatching hashes.
        guard let mostPreciseHash = providers
                .flatMap({ $0.region })
                .sorted (by: { $0.count > $1.count })
                .first
        else { return nil }

        let truncatedHash = hash.prefix(mostPreciseHash.count)

        for provider in providers {
            for x in 0..<truncatedHash.count {
                let searching = String(truncatedHash.prefix(truncatedHash.count - x))
                let result = provider.trie.findWordsWithPrefix(prefix: searching)

                if let potentialResult = result.first {
                    results[potentialResult] = provider
                    break
                }
            }
        }

        guard !results.isEmpty else { return nil }
        self.providers = results.sorted { $0.key > $1.key }
    }
}
