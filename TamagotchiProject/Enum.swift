//
//  Enum.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/7/24.
//

import Foundation


enum SettingType {
    case changNicname, changeTG, reset
    
    var title: String {
        switch self {
        case .changNicname:
            "닉네임 설정하기"
        case .changeTG:
            "다마고치 변경하기"
        case .reset:
            "데이터 초기화하기"
        }
    }
    
    var image: String {
        switch self {
        case .changNicname:
            "pencil"
        case .changeTG:
            "moon.fill"
        case .reset:
            "arrow.clockwise"
        }
    }
}

enum ViewType {
    case selectTG, main, setting, changeNicname, changeTG
    
    var navTitle: String {
        switch self {
        case .selectTG:
            "다마고치 선택하기"
        case .main:
            "대장님의 다마고치"
        case .setting:
            "설정"
        case .changeNicname:
            "닉네임 설정하기"
        case .changeTG:
            "다마고치 변경하기"
        }
    }
}

enum Raise: String {
    case rice = "밥주기"
    case water = "물주기"
    
    var placeholderText: String {
        switch self {
        case .rice:
            "밥주세요"
        case .water:
            "물주세요"
        }
    }
}
