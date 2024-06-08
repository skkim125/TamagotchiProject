//
//  MainViewController.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/7/24.
//

import UIKit

class MainViewController: UIViewController {
    lazy var bubbleImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "bubble")
//        imgView.contentMode = .scaleAspectFit
        
        return imgView
    }()
    
    lazy var bubbleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var tgImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        
        return imgView
    }()
    
    lazy var tgNameBackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        view.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 6
        
        
        return view
    }()
    
    lazy var tgNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return label
    }()
    
    lazy var tgInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        
       return label
    }()
    
    lazy var riceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [raiseRiceTF, raiseRiceButton])
        stackView.spacing = 8
        
        return stackView
    }()
    
    lazy var raiseRiceTF: UITextField = {
       let tf = UITextField()
        tf.textAlignment = .center
        tf.placeholder = "밥 주세요"
        
        tf.borderStyle = .none
        
        return tf
    }()
    
    lazy var raiseRiceTFDivider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        return view
    }()
    
    lazy var raiseRiceButton: UIButton = {
        let button = UIButton()
        button.setTitle("밥주기", for: .normal)
        button.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        button.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        button.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        button.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        
        return button
    }()
    
    lazy var waterStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [raiseWaterTF, raiseWaterButton])
        stackView.spacing = 8
        
        return stackView
    }()
    
    lazy var raiseWaterTF: UITextField = {
       let tf = UITextField()
        tf.textAlignment = .center
        tf.placeholder = "물 주세요"
        
        tf.borderStyle = .none
        
        return tf
    }()
    
    lazy var raiseWaterTFDivider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        return view
    }()
    
    lazy var raiseWaterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("물주기", for: .normal)
        button.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        button.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        button.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        button.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        
        return button
    }()
    
    var tamagotchi: Tamagotchi?
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureHierarchy()
        configureLayout()
        configureNavigationView()
        setTGMainView()
    }
    
    func configureHierarchy() {
        // MARK: addSubView()
        view.addSubview(bubbleImgView)
        view.addSubview(bubbleLabel)
        view.addSubview(tgImageView)
        view.addSubview(tgInfoLabel)
        view.addSubview(tgNameBackView)
        view.addSubview(tgNameLabel)
        view.addSubview(riceStackView)
        view.addSubview(raiseRiceTFDivider)
        view.addSubview(waterStackView)
        view.addSubview(raiseWaterTFDivider)
    }
    
    func configureLayout() {
        
        bubbleImgView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(80)
        }
        
        bubbleLabel.snp.makeConstraints { make in
            make.top.equalTo(bubbleImgView.snp.top).offset(12)
            make.leading.equalTo(bubbleImgView.snp.leading).offset(20)
            make.trailing.equalTo(bubbleImgView.snp.trailing).inset(20)
            make.bottom.equalTo(bubbleImgView.snp.bottom).inset(20)
        }
        
        tgImageView.snp.makeConstraints { make in
            make.top.equalTo(bubbleImgView.snp.bottom).offset(4)
            make.centerX.equalTo(view)
            make.width.equalTo(280)
        }
        
        tgNameBackView.snp.makeConstraints { make in
            make.top.equalTo(tgImageView.snp.bottom).offset(8)
            make.centerX.equalTo(tgImageView)
            make.width.equalTo(180)
            make.height.equalTo(36)
        }
        
        tgNameLabel.snp.makeConstraints { make in
            make.edges.equalTo(tgNameBackView)
            make.size.equalTo(tgNameBackView)
        }
        
        tgInfoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(tgNameBackView)
            make.top.equalTo(tgNameBackView.snp.bottom).offset(12)
            make.width.equalTo(200)
            make.height.equalTo(36)
        }
        
        riceStackView.snp.makeConstraints { make in
            make.top.equalTo(tgInfoLabel.snp.bottom).offset(28)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(80)
            make.height.equalTo(36)
        }
        
        raiseRiceTF.snp.makeConstraints { make in
            make.width.equalTo(150)
        }
        
        raiseRiceTFDivider.snp.makeConstraints { make in
            make.leading.equalTo(riceStackView.snp.leading)
            make.bottom.equalTo(riceStackView.snp.bottom)
            make.width.equalTo(raiseRiceTF)
            make.height.equalTo(2)
        }
        
        waterStackView.snp.makeConstraints { make in
            make.top.equalTo(riceStackView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(80)
            make.height.equalTo(36)
        }
        
        raiseWaterTF.snp.makeConstraints { make in
            make.width.equalTo(150)
        }
        
        raiseWaterTFDivider.snp.makeConstraints { make in
            make.leading.equalTo(waterStackView.snp.leading)
            make.bottom.equalTo(waterStackView.snp.bottom)
            make.width.equalTo(raiseWaterTF)
            make.height.equalTo(2)
        }
    }

    func configureNavigationView() {
        let right = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(moveUserVIew))
        navigationItem.rightBarButtonItem = right
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.tintColor = .darkGray
        UINavigationBarAppearance().shadowColor = .lightGray
        navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
    }
    
    func setTGMainView() {
        if let user = self.user, let t = self.tamagotchi {
            navigationItem.title = "\(user.userName)님의 다마고치"
            tgImageView.image = UIImage(named: t.image)
            tgNameLabel.text = t.name
            tgInfoLabel.text = "Lv.\(t.level) | 밥알 \(t.rice)개 | 물방울 \(t.water)개"
        }
    }
    
    @objc func moveUserVIew() {
        let vc = SettingViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
