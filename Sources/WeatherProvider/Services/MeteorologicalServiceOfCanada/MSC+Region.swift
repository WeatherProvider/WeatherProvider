import GeohashKit
import NationalWeatherService

extension WXPMeteorologicalServiceOfCanada {
    public static var region: Set<Geohash.Hash> {
        return [
            // Canada
            "c", "f", "bf", "bg", "bu",

            // Toronto-ish
            "dpv", "dpt", "dpy", "dpw", "dpz", "dpx", "drb", "drc", "drf", "dpsb", "dpkz",

            // nova scotia
            "dxb" ,"dxc" ,"dxf" ,"dxg" ,"dx9"
        ]
    }

    // TODO: DRY this
    static var trie: Trie = {
        let trie = Trie()
        region.forEach { trie.insert(word: $0) }
        return trie
    }()
}
