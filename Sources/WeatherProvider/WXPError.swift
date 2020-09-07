//
//  WXPError.swift
//  
//
//  Created by Alan Chu on 8/4/20.
//

import Foundation

public enum WXPError: Error {
    case historicalDataUnavailable
    case futureDataUnavailable

    case noDataAvailable

    case other(Error)
}
