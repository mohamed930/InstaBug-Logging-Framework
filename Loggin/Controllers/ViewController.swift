//
//  ViewController.swift
//  Loggin
//
//  Created by Mohamed Ali on 31/05/2021.
//

import UIKit
import InstaBug_Logging

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyLogger.addLogProfileToAllLevels(defaultLoggerProfile: LoggerConsole())
        
        MyLogger.writeLog(logLevel: LogLevels.Debug, message: "Debug Message 1")

        MyLogger.writeLog(logLevel: LogLevels.Error, message: "Error Message 1")
        
    }


}

