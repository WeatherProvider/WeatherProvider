//
//  File.swift
//  
//
//  Created by Alan Chu on 7/13/20.
//

import GeohashKit

public protocol Location {
    var latitude: Double { get }
    var longitude: Double { get }

    init(geohash: Geohash)
}
