//
//  ViewController.swift
//  Loggin
//
//  Created by Mohamed Ali on 31/05/2021.
//

import UIKit
import InstaBug_Logging
import CoreData

class ViewController: UIViewController {
    
    var LoggingMessageArr = Array<NSManagedObject>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyLogger.addLogProfileToAllLevels(defaultLoggerProfile: LoggerConsole())

        MyLogger.writeLog(logLevel: LogLevels.Debug, message: "Debug Message 1")

        MyLogger.writeLog(logLevel: LogLevels.Error, message: "Error Message 1")
        
//        let ob = CoreDataViewModel()
//
//        guard let LoggingMessage = ob.fetch() else {
//            print("❌ Failed Logging is Empty")
//            return
//        }
//        LoggingMessageArr = LoggingMessage
//
//        for i in LoggingMessageArr {
//            print("LogMess: \(i.value(forKeyPath: "loggingMessage") as! String)")
//        }
        
    }


}

