//
//  AppDelegate.swift
//  reMIND
//
//  Created by Eugenio Barquín on 29/12/16.
//  Copyright © 2016 Eugenio Barquín. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        TaskManager.shareInstance.load()        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        TaskManager.shareInstance.save()
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        TaskManager.shareInstance.save()

       
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        TaskManager.shareInstance.load()

    
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        TaskManager.shareInstance.load()

     
    }

    func applicationWillTerminate(_ application: UIApplication) {
        TaskManager.shareInstance.save()

    
    }


}

