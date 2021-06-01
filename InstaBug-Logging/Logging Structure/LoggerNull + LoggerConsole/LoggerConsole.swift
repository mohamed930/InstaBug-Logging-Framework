//
//  LoggerConsole.swift
//  InstaBug-Logging
//
//  Created by Mohamed Ali on 31/05/2021.
//

import Foundation

public struct LoggerConsole: LoggerProfile {
    public init() {
        
    }
    public let loggerProfileId = "hoffman.mohamed.logger.console"
    public func writelog(level: String, message: String) {
        let now = getCurrentDateString()
        print("\(now): \(level) - \(message)")
        
        let ob = CoreDataViewModel()
        ob.createLogging(loggingDate: now, loggingMessage: message, loggingType: level)
        
    }
}
