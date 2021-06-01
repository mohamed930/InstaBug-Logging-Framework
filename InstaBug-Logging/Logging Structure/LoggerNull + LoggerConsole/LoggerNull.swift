//
//  LoggerNull.swift
//  InstaBug-Logging
//
//  Created by Mohamed Ali on 31/05/2021.
//

import Foundation

public struct LoggerNull: LoggerProfile {
    public let loggerProfileId = "hoffman.mohamed.logger.null"
    public func writelog(level: String, message: String) {
        // Do Nothing
    }
} 
