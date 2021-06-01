//
//  Logger.swift
//  InstaBug-Logging
//
//  Created by Mohamed Ali on 31/05/2021.
//

import Foundation

public protocol Logger {
    static var logger: [LogLevels: [LoggerProfile]] {get set}
    static func writeLog(logLevel: LogLevels,message: String)
}
