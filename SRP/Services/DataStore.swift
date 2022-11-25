//
//  DataStore.swift
//  SRP
//
//  Created by Artur on 18.11.2022.
//

import Foundation



class DataStore {
    func saveNameInCache(name:String){
        print("Your name: \(name) is saved")
        
    }
    func getNameFromCache() -> String {
        return "some name"
    }
    
}
