//
//  File.swift
//  
//
//  Created by Alan Chu on 7/13/20.
//

import Foundation

public protocol ForecastPeriod {
    var applicableTime: DateInterval { get }
    var temperature: Measurement<UnitTemperature> { get }
    var wind: Wind? { get }

    var forecast: String? { get }
    var detailedForecast: String? { get }
}
