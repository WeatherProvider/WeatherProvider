//
//  ForecastPeriod.swift
//  
//
//  Created by Alan Chu on 7/13/20.
//

import Foundation

public protocol WXPForecastPeriod {
    var applicableTime: DateInterval { get }
    var temperature: Measurement<UnitTemperature> { get }
    var wxpWind: WXPWind? { get }

    var wxpCondition: WXPCondition? { get }

    var forecast: String? { get }
    var detailedForecast: String? { get }
}
