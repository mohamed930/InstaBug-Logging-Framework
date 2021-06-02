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
            self.CheckLogMessageCountInCoreData(loggingDate: now, loggingMessage: message, loggingType: level)
            
        }
        else {
            // Print Logging Message into Console.
            let now = getCurrentDateString()
            print("\(now): \(level) - \(message)")
            
            // Save Logging Message into CoreData.
            self.CheckLogMessageCountInCoreData(loggingDate: now, loggingMessage: message, loggingType: level)
        }
        
    }
    
    
    
    private func CheckLogMessageCountInCoreData(loggingDate: String , loggingMessage: String , loggingType: String) {
        let ob = CoreDataViewModel()
        
        guard let rows = ob.fetch() else {
            return
        }
        
        if rows.count >= 1000 {
            
            // Delete earlest message and write new message
            ob.Delete(element: rows[0])
            ob.createLogging(loggingDate: loggingDate, loggingMessage: loggingMessage, loggingType: loggingType)
            
        }
        else {
            // Save Logging message normally.
            ob.createLogging(loggingDate: loggingDate, loggingMessage: loggingMessage, loggingType: loggingType)
        }
        
    }
}
