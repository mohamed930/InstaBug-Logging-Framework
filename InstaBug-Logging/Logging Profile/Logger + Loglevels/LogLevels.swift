//
//  LogLevels.swift
//  InstaBug-Logging
//
//  Created by Mohamed Ali on 31/05/2021.
//

import Foundation

public enum LogLevels: String {
    case Error
    case Fetal
    case Warn
    case Debug
    case Info

    static let allValues = [Error,Fetal,Warn,Debug,Info]
}
