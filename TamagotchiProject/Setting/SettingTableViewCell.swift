//
//  SettingTableViewCell.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/8/24.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundColor = .white
    }
    
    func setUI(setting: SettingType) {
        imageView?.image = UIImage(systemName: setting.image)
        textLabel?.text = setting.title
        accessoryType = .disclosureIndicator
        tintColor = UIColor.mainColor
    }
    
}
