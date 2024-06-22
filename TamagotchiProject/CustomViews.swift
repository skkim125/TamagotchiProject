//
//  CustomViews.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/13/24.
//

import UIKit

class RaiseButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(UIColor.mainColor, for: .normal)
        setImage(UIImage(systemName: "drop.circle"), for: .normal)
        tintColor = UIColor.mainColor
        layer.borderColor = UIColor.mainColor.cgColor
        layer.borderWidth = 1.5
        layer.cornerRadius = 8
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
