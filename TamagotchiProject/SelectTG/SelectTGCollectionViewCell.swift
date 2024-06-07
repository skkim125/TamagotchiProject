//
//  SelectTGCollectionViewCell.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/7/24.
//

import UIKit
import SnapKit

class SelectTGCollectionViewCell: UICollectionViewCell {
    var tamagotchi: Tamagotchi?
    
    lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "1-1")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    lazy var tgNameBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 8
        
        
        return view
    }()
    
    lazy var tgNameLabel: UILabel = {
       let label = UILabel()
        label.text = "준비중입니다"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
    }
    
    func configureHierarchy() {
        // MARK: addSubView()
        contentView.addSubview(imageView)
        contentView.addSubview(tgNameBackView)
        contentView.addSubview(tgNameLabel)
    }
    
    func configureLayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide).inset(24)
        }
        
        tgNameBackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(4)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide)
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
        imageView.image = UIImage(named: data.image)
        tgNameLabel.text = data.name
        tgNameLabel.textColor = .black
        tgNameBackView.layer.borderColor = UIColor.black.cgColor
    }
}
