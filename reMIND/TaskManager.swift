//
//  TaskManager.swift
//  reMIND
//
//  Created by Eugenio Barquín on 29/12/16.
//  Copyright © 2016 Eugenio Barquín. All rights reserved.
//

import Foundation

class TaskManager {
    
    //Convertimos la clase en singleton, es decir solo puede haber una instancia de ella.
    static let shareInstance = TaskManager()
    
    var tasks : [[String : String]] = [[String: String]]()
    
    func save() {
        UserDefaults.standard.set(tasks, forKey: "tasks")
        
    }
    
    func load() {
        if let array = UserDefaults.standard.array(forKey: "tasks") as? [[String : String]] {
            tasks = array
        }
        
    }
}
