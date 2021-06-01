//
//  MyLogger.swift
//  InstaBug-Logging
//
//  Created by Mohamed Ali on 01/06/2021.
//

import Foundation

public struct MyLogger: Logger {
    
    public static var logger = [LogLevels:[LoggerProfile]]()
    
    public static func writeLog(logLevel: LogLevels, message: String) {
        guard hasLoggerForLevel(logLevel: logLevel) else {
            print("No logger")
            return
        }
        if let logProfiles = logger[logLevel] {

            for logProfile in logProfiles {
                logProfile.writelog(level: logLevel.rawValue, message: message)
            }
        }
    }
}
