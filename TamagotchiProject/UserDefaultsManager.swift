//
//  UserDefaultsManager.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/10/24.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    let userDefaults = UserDefaults.standard
    
    enum UserDefaultsKey: String {
        case first_Reset, lastTgID, userName
        
        static func tgRiceKey(tgId: Int) -> String {
            return "\(tgId) 밥알"
        }
        
        static func tgWaterKey(tgId: Int) -> String {
            return "\(tgId) 물"
        }
    }
    
    var userName: String {
        get {
            guard let userName = userDefaults.string(forKey: UserDefaultsKey.userName.rawValue) else {
                return "대장"
            }
            return userName
        }
        
        set { userDefaults.setValue(newValue, forKey: UserDefaultsKey.userName.rawValue) }
    }
    
    var firstReset: Bool {
        get { userDefaults.bool(forKey: UserDefaultsKey.first_Reset.rawValue) }
        set { userDefaults.setValue(newValue, forKey: UserDefaultsKey.first_Reset.rawValue) }
    }
    
    var lastTg: Int {
        get { userDefaults.integer(forKey: UserDefaultsKey.lastTgID.rawValue) }
        set { userDefaults.setValue(newValue, forKey: UserDefaultsKey.lastTgID.rawValue) }
    }
    
    
    func reset() {
        var list = TamagotchiManager.shared.tamagotchiList
        for i in 0...list.count-1 {
            list[i].rice = 0
            list[i].water = 0
            userDefaults.removeObject(forKey: "\(UserDefaultsKey.tgRiceKey(tgId: list[i].id)) 밥알")
            userDefaults.removeObject(forKey: "\(UserDefaultsKey.tgWaterKey(tgId: list[i].id)) 물")
        }
        
        userDefaults.removeObject(forKey: UserDefaultsKey.userName.rawValue)
        userDefaults.removeObject(forKey: UserDefaultsKey.first_Reset.rawValue)
        userDefaults.removeObject(forKey: UserDefaultsKey.lastTgID.rawValue)
    }
}
