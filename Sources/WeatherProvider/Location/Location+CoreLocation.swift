//
//  File.swift
//  
//
//  Created by Alan Chu on 7/13/20.
//

#if canImport(CoreLocation)
import CoreLocation

extension CLLocationCoordinate2D: Location {
}

extension CLLocation: Location {
    public var latitude: Double { self.coordinate.latitude }
    public var longitude: Double { self.coordinate.longitude }
}
#endif
