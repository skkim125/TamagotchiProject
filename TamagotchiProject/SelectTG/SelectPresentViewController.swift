//
//  SelectPresentViewController.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/7/24.
//

import UIKit
import SnapKit

class SelectPresentViewController: UIViewController {
    var tamagotchi: Tamagotchi?
    
    lazy var tamagotchiImgView: UIImageView = {
        let imgView = UIImageView()
        
        return imgView
    }()
    
    lazy var tgNameBackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        view.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 8
        
        
        return view
    }()
    
    lazy var tgNameLabel: UILabel = {
       let label = UILabel()
        label.text = "준비중입니다"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    lazy var tgSubLabel: UILabel = {
        let label = UILabel()
        label.text = "비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부비비디바비디부"
        label.textAlignment = .center
        label.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.backgroundColor = .lightGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    lazy var chooseButton: UIButton = {
        let button = UIButton()
        button.setTitle("선택하기", for: .normal)
        button.backgroundColor = .blue.withAlphaComponent(0.8)
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(ChooseButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureHierarchy()
        configureLayout()
    }
    
    func configureHierarchy() {
        view.addSubview(tamagotchiImgView)
        view.addSubview(tgNameBackView)
        view.addSubview(tgNameLabel)
        view.addSubview(dividerLine)
        view.addSubview(tgSubLabel)
        view.addSubview(backButton)
        view.addSubview(chooseButton)
    }
    
    func configureLayout() {
        tamagotchiImgView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.height.equalTo(180)
        }
        
        tgNameBackView.snp.makeConstraints { make in
            make.top.equalTo(tamagotchiImgView.snp.bottom).offset(12)
            make.centerX.equalTo(tamagotchiImgView)
            make.width.equalTo(180)
            make.height.equalTo(36)
        }
        
        tgNameLabel.snp.makeConstraints { make in
            make.edges.equalTo(tgNameBackView)
            make.size.equalTo(tgNameBackView)
        }
        
        dividerLine.snp.makeConstraints { make in
            make.top.equalTo(tgNameLabel.snp.bottom).offset(48)
            make.horizontalEdges.equalTo(tamagotchiImgView.snp.horizontalEdges)
            make.height.equalTo(2)
        }
        
        tgSubLabel.snp.makeConstraints { make in
            make.top.equalTo(dividerLine.snp.bottom).offset(48)
            make.horizontalEdges.equalTo(dividerLine.snp.horizontalEdges)
            make.height.equalTo(60)
            
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(tgSubLabel.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.height.equalTo(48)
        }
        
        chooseButton.snp.makeConstraints { make in
            make.top.equalTo(backButton)
            make.leading.equalTo(backButton.snp.trailing).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.bottom.equalTo(backButton.snp.bottom)
            make.size.equalTo(backButton)
        }
    }
    
    func setSelectTGView() {
        if let t = self.tamagotchi {
            tamagotchiImgView.image = UIImage(named: "\(t.mainImage)")
            tamagotchiImgView.contentMode = .scaleAspectFit
            tgNameLabel.text = t.name
        }
    }
    
    @objc func backButtonClicked() {
        dismiss(animated: true)
    }
    
    @objc func ChooseButtonClicked() {
        if let presentingViewController = self.presentingViewController as? UINavigationController  {
            self.dismiss(animated: true) {
                let vc = MainViewController()
                if let t = self.tamagotchi, let user = self.user {
                    vc.tamagotchi = t
                    vc.user = user
//                    vc.setTGMainView()
                }
                presentingViewController.pushViewController(vc, animated: true)
                
            }
        }
    }
}
