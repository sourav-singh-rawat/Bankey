//
//  LocalState.swift
//  Bankey
//
//  Created by Sourav Singh Rawat on 05/12/22.
//

import Foundation



struct LocalState {

    private static let userDefaults = UserDefaults.standard
    
    private enum Keys: String {
        case hasOnboarded
    }
    
    public static var hasOnboarded: Bool {
        get {
            return userDefaults.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set(newValue){
            userDefaults.set(newValue, forKey: Keys.hasOnboarded.rawValue)
        }
    }
}
