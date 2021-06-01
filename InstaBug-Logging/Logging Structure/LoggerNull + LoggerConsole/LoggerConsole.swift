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
        
        if message.count > 1000 {
            // Truncate messagae to 1000 char
            let mess = message.truncate(length: 1000)
            
            // Print Logging Message into Console.
            let now = getCurrentDateString()
            print("\(now): \(level) - \(mess)")
            
            // Save Logging Message into CoreData.
            let ob = CoreDataViewModel()
            ob.createLogging(loggingDate: now, loggingMessage: mess, loggingType: level)
            
        }
        else {
            // Print Logging Message into Console.
            let now = getCurrentDateString()
            print("\(now): \(level) - \(message)")
            
            // Save Logging Message into CoreData.
            let ob = CoreDataViewModel()
            ob.createLogging(loggingDate: now, loggingMessage: message, loggingType: level)
        }
        
    }
}
