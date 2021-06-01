//
//  LoggerProfileExtension.swift
//  InstaBug-Logging
//
//  Created by Mohamed Ali on 31/05/2021.
//

import Foundation

extension LoggerProfile {
    public func getCurrentDateString() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm"
        return dateFormatter.string(from: date)
    }
}
