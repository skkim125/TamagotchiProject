//
//  SelectTGCollectionViewCell.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/7/24.
//

import UIKit
import SnapKit

class SelectTGCollectionViewCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "noImage")
        imgView.contentMode = .scaleAspectFit
        
        return imgView
    }()
    
    lazy var tgNameBackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.bgColor
        view.layer.borderColor = UIColor.mainColor.cgColor
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 6
        
        
        return view
    }()
    
    lazy var tgNameLabel: UILabel = {
       let label = UILabel()
        label.text = "준비중입니다"
        label.textColor = UIColor.mainColor
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        
        return label
    }()
    
    var tamagotchi: Tamagotchi?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
    }
    
    func configureHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(tgNameBackView)
        contentView.addSubview(tgNameLabel)
    }
    
    func configureLayout() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(12)
            make.height.equalTo(imageView.snp.width)
        }
        
        tgNameBackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(4)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(30)
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(12)
        }
        
        tgNameLabel.snp.makeConstraints { make in
            make.edges.equalTo(tgNameBackView)
            make.size.equalTo(tgNameBackView.snp.size)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabelText(data: Tamagotchi) {
        imageView.image = UIImage(named: data.mainImage)
        tgNameLabel.text = data.name
    }
}
