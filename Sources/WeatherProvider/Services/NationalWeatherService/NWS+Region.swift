//
//  File.swift
//  
//
//  Created by Alan Chu on 9/13/20.
//

import GeohashKit
import NationalWeatherService

extension NationalWeatherService {
    public static var region: Set<Geohash.Hash> {
        return [
            // Lower 48th
            "c0", "f0", "f2", "f8", "9p", "9r", "9x", "9z", "dp", "dr", "9n",
            "9q", "9w", "9y", "dn", "dq", "9m", "9t", "9v", "dj", "9u", "dh",

            // Below 49th parallel, up to Wisconsin-ish
            "c28", "c29", "c2d", "c2e", "c2s", "c2t", "c2w", "c2x", "c88",
            "c89", "c8d", "c8e", "c8s", "c8t", "c8w", "c8x", "cb8", "cb9",
            "cbd", "cbe", "cbs", "cbt", "cbw", "cbx", "c22", "c23", "c26",
            "c27", "c2k", "c2m", "c2q", "c2r", "c82", "c83", "c86", "c87",
            "c8k", "c8m", "c8q", "c8r", "cb2", "cb3", "cb6", "cb7", "cbk",
            "cbm", "cbq", "cbr", "c20", "c21", "c24", "c25", "c2h", "c2j",
            "c2n", "c2p", "c80", "c81", "c84", "c85", "c8h", "c8j", "c8n",
            "c8p", "cb0", "cb1", "cb4", "cb5", "cbh", "cbj", "cbn", "cbp",

            // Maine exclave
            "f2j", "f2n", "f2p", "f80", "f2q", "f2r",

            // Alaska
            "bk", "bs", "bu", "b5", "b7", "be", "bg", "b6", "bd", "bf", "c4",
            "c1", "zc", "b1", "b3",

            // Hawaii
            "87", "8e"
        ]
    }
}
