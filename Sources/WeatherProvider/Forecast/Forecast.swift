//
//  File.swift
//  
//
//  Created by Alan Chu on 7/13/20.
//

import Foundation

public protocol Forecast {
    var updatedAt: Date { get }
    var validTimes: DateInterval { get }
    var elevation: Measurement<UnitLength> { get }
    var periods: [ForecastPeriod] { get }
}
