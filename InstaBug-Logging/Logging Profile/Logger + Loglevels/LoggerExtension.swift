//
//  LoggerExtension.swift
//  InstaBug-Logging
//
//  Created by Mohamed Ali on 31/05/2021.
//

import Foundation

extension Logger {
    public static func logLevelContainsProfile(logLevel: LogLevels, loggerProfile: LoggerProfile) -> Bool {
            if let logProfiles = logger[logLevel] {
                for logProfile in logProfiles where
                    logProfile.loggerProfileId == loggerProfile.loggerProfileId {
                        return true
                }
            }
            return false
        }

    public static func setLogLevel(logLevel: LogLevels, loggerProfile: LoggerProfile) {

        if let _ = logger[logLevel] {
            if !logLevelContainsProfile(logLevel: logLevel, loggerProfile: loggerProfile) {
                logger[logLevel]?.append(loggerProfile)
            }
        } else {
            var a = [LoggerProfile]()
            a.append(loggerProfile)

            logger[logLevel] = a
        }
    }

    public static func addLogProfileToAllLevels( defaultLoggerProfile: LoggerProfile) {
        for level in LogLevels.allValues {
            setLogLevel(logLevel: level, loggerProfile: defaultLoggerProfile)
        }
    }

    public static func removeLogProfileFromLevel(logLevel: LogLevels, loggerProfile:LoggerProfile) {
        if var logProfiles = logger[logLevel] {
            if let index = logProfiles.firstIndex(where:
                {$0.loggerProfileId == loggerProfile.loggerProfileId}) {
                logProfiles.remove(at: index)
            }
            logger[logLevel] = logProfiles
        }
    }

    public static func removeLogProfileFromAllLevels(loggerProfile:LoggerProfile) {
        for level in LogLevels.allValues {
            removeLogProfileFromLevel(logLevel: level, loggerProfile: loggerProfile)
        }
    }

    public static func hasLoggerForLevel(logLevel: LogLevels) -> Bool {
        guard let _ = logger[logLevel] else {
            return false
        }
        return true
    }
}
