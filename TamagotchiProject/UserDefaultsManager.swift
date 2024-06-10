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
    
    func saveUserName(userName: String) {
        userDefaults.set(userName, forKey: UserDefaultsKey.userName.rawValue)
    }
    
    func saveFirst_Reset(_ bool: Bool) {
        userDefaults.setValue(bool, forKey: UserDefaultsKey.first_Reset.rawValue)
    }
    
    func saveLastTg(id: Int) {
        UserDefaults.standard.set(id, forKey: UserDefaultsKey.lastTgID.rawValue)
    }
    
    func saveTgRice(tgID: Int, rice: Int) {
        userDefaults.setValue(rice, forKey: UserDefaultsKey.tgRiceKey(tgId: tgID))
    }
    
    func saveTgWater(tgID: Int, water: Int) {
        userDefaults.setValue(water, forKey: UserDefaultsKey.tgWaterKey(tgId: tgID))
    }
    
    func loadUserName() -> String {
        guard let userName = userDefaults.string(forKey: UserDefaultsKey.userName.rawValue) else {
            return "대장"
        }
        return userName
    }
    
    func loadFirst_Reset() -> Bool {
        return userDefaults.bool(forKey: UserDefaultsKey.first_Reset.rawValue)
    }
    
    func loadLastTg() -> Int {
        return userDefaults.integer(forKey: UserDefaultsKey.lastTgID.rawValue)
    }
    
    func loadTgRice(tgID: Int) -> Int {
       return userDefaults.integer(forKey: UserDefaultsKey.tgRiceKey(tgId: tgID))
    }
    
    func loadTgWater(tgID: Int) -> Int {
        return userDefaults.integer(forKey: UserDefaultsKey.tgWaterKey(tgId: tgID))
    }
    
    func reset() {
        var list = User.user.tamagotchiList
        for i in 0...list.count-1 {
            list[i].rice = 0
            list[i].water = 0
            userDefaults.removeObject(forKey: "\(UserDefaultsKey.tgRiceKey(tgId: list[i].id)) 밥알")
            userDefaults.removeObject(forKey: "\(UserDefaultsKey.tgWaterKey(tgId: list[i].id)) 물")
        }
        
        userDefaults.removeObject(forKey: UserDefaultsKey.userName.rawValue)
        userDefaults.removeObject(forKey: UserDefaultsKey.first_Reset.rawValue)
        userDefaults.removeObject(forKey: UserDefaultsKey.lastTgID.rawValue)
        User.userName = "대장"
    }
}
