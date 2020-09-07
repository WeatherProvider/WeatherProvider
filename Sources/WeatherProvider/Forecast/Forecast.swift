//
//  Forecast.swift
//  
//
//  Created by Alan Chu on 7/13/20.
//

import Foundation

public protocol WXPForecast {
    var updatedAt: Date { get }
    var validTimes: DateInterval { get }
    var elevation: Measurement<UnitLength> { get }
    var wxpPeriods: [WXPForecastPeriod] { get }
}
