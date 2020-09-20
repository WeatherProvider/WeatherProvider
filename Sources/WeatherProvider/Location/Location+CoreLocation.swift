//
//  File.swift
//  
//
//  Created by Alan Chu on 7/13/20.
//

import GeohashKit

#if canImport(CoreLocation)
import CoreLocation

extension CLLocationCoordinate2D: Location {
    public init(geohash: Geohash) {
        self.init(latitude: geohash.latitude, longitude: geohash.longitude)
    }
}
#endif
