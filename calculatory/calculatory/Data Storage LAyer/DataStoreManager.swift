//
//  DataStoreManager.swift
//  calculatory
//
//  Created by Mohamed Elatabany on 28/01/2022.



import Foundation


protocol DataStoreProtocol {
    var key: String { get }

    func set(_ value: Any)
    
    func getValue() -> Any?
    
    func deleteValue()
    
}



struct DataStoreUserDefaultsManager: DataStoreProtocol {

    // MARK: - Unique Key
    
    let key: String
    
    // MARK: - Storing Data
    
    func set(_ value: Any) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func getValue() -> Any? {
        UserDefaults.standard.object(forKey: key)
    }
    
    // MARK: - Deleting Data
    
    func deleteValue() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}




