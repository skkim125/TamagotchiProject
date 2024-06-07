//
//  Tamagotchi.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/7/24.
//

import Foundation

struct User {
    let userName: String
    let tamagotchiList: [Tamagotchi] = [Tamagotchi(id: 1, name: "풀 다마고치", rice: 0, water: 0), Tamagotchi(id: 2, name: "태양 다마고치", rice: 0, water: 0), Tamagotchi(id: 3, name: "별 다마고치", rice: 0, water: 0)]
}

struct Tamagotchi {
    let id: Int
    let name: String
    var rice: Int
    var water: Int
    var level: Int {
        let levelCount = Int(self.rice / 5) + Int(self.water / 2)
        
        switch levelCount {
        case 0..<10:
            return 1
        case 10..<20:
            return 1
        case 21..<30:
            return 2
        case 21..<40:
            return 3
        case 21..<50:
            return 4
        case 21..<60:
            return 5
        case 21..<70:
            return 6
        case 21..<80:
            return 7
        case 21..<90:
            return 8
        case 90..<100:
            return 9
        case 100...:
            return 9
        default:
            return 0
        }
    }
    
    var image: String {
        switch self.level {
        case 1:
            "\(self.id)-1"
        case 2:
            "\(self.id)-2"
        case 3:
            "\(self.id)-3"
        case 4:
            "\(self.id)-4"
        case 5:
            "\(self.id)-5"
        case 6:
            "\(self.id)-6"
        case 7:
            "\(self.id)-7"
        case 8:
            "\(self.id)-8"
        case 9:
            "\(self.id)-9"
        default:
            "\(self.id)-9"
        }
    }
    
//    mutating func levelUP() {
//        let level = Int(self.rice / 5) + Int(self.water / 2)
//        if level < 20 {
//            self.level = 1
//        } else if level > 100 {
//            self.level = 10
//        } else {
//            self.level = Int(self.rice / 5) + Int(self.water / 2)
//        }
//    }
}
