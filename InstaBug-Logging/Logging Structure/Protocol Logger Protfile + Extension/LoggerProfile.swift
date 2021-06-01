//
//  LoggerProfile.swift
//  InstaBug-Logging
//
//  Created by Mohamed Ali on 31/05/2021.
//

import Foundation

public protocol LoggerProfile {
    var loggerProfileId: String {get}
    func writelog(level: String, message: String)
}
