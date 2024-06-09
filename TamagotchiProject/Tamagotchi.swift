//
//  Tamagotchi.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/7/24.
//

import Foundation

struct User {
    static var user = User()
    static var userName: String = "대장"
    var tamagotchiList: [Tamagotchi] = [Tamagotchi(id: 0, rice: 0, water: 0), Tamagotchi(id: 1, rice: 0, water: 0), Tamagotchi(id: 2, rice: 0, water: 0)]
}

struct Tamagotchi {
    let id: Int
    var name: String {
        switch self.id {
        case 0:
            "풀 다마고치"
        case 1:
            "태양 다마고치"
        case 2:
            "별 다마고치"
        default:
            "준비중입니다"
        }
    }
    var rice: Int
    var water: Int
    
    var mainImage: String {
        switch self.id {
        case 0:
            "1-6"
        case 1:
            "2-6"
        case 2:
            "3-6"
        default:
            ""
        }
    }
    
    static func setLevel(rice: Int, water: Int) -> Int {
        let levelCount = Int(rice / 5) + Int(water / 2)
        
        switch levelCount {
        case 0..<10:
            return 1
        case 10..<20:
            return 1
        case 20..<30:
            return 2
        case 30..<40:
            return 3
        case 40..<50:
            return 4
        case 50..<60:
            return 5
        case 60..<70:
            return 6
        case 70..<80:
            return 7
        case 80..<90:
            return 8
        case 90..<100:
            return 9
        case 100...:
            return 9
        default:
            return 0
        }
    }
    
    static func setImage(id: Int, level: Int) -> String {
        switch level {
        case 1:
            "\(id+1)-1"
        case 2:
            "\(id+1)-2"
        case 3:
            "\(id+1)-3"
        case 4:
            "\(id+1)-4"
        case 5:
            "\(id+1)-5"
        case 6:
            "\(id+1)-6"
        case 7:
            "\(id+1)-7"
        case 8:
            "\(id+1)-8"
        case 9:
            "\(id+1)-9"
        default:
            "\(id+1)-9"
        }
    }
}
