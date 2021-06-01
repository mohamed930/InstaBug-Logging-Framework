//
//  String.swift
//  InstaBug-Logging
//
//  Created by Mohamed Ali on 01/06/2021.
//

import Foundation

extension String {
    func truncate (length: Int, AddedMark: String = "...") -> String {
        
        return (self.count > length) ? self.prefix(length) + " " + AddedMark : self
    }
}
