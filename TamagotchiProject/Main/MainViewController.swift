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
        
        return imgView
    }()
    
    lazy var bubbleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mainColor
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
        view.backgroundColor = UIColor.bgColor
        view.layer.borderColor = UIColor.mainColor.cgColor
        view.layer.borderWidth = 0.8
        view.layer.cornerRadius = 6
        
        
        return view
    }()
    
    lazy var tgNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor.mainColor
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return label
    }()
    
    lazy var tgInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mainColor
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        
       return label
    }()
    
    lazy var riceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [raiseRiceTF, raiseRiceButton])
        stackView.spacing = 12
        
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
        view.backgroundColor = UIColor.mainColor
        
        return view
    }()
    
    lazy var raiseRiceButton: UIButton = {
        let button = UIButton()
        button.setTitle("밥주기", for: .normal)
        button.setTitleColor(UIColor.mainColor, for: .normal)
        button.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        button.tintColor = UIColor.mainColor
        button.layer.borderColor = UIColor.mainColor.cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(raiseRice), for: .touchUpInside)
        
        return button
    }()
    
    lazy var waterStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [raiseWaterTF, raiseWaterButton])
        stackView.spacing = 12
        
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
        view.backgroundColor = UIColor.mainColor
        
        return view
    }()
    
    lazy var raiseWaterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("물주기", for: .normal)
        button.setTitleColor(UIColor.mainColor, for: .normal)
        button.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        button.tintColor = UIColor.mainColor
        button.layer.borderColor = UIColor.mainColor.cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(raiseWater), for: .touchUpInside)
        
        return button
    }()
    
    var tamagotchi: Tamagotchi?
    var viewType: ViewType = .main
    
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
            make.horizontalEdges.lessThanOrEqualTo(view.safeAreaLayoutGuide).inset(70)
            make.height.equalTo(36)
        }
        
        riceStackView.snp.makeConstraints { make in
            make.top.equalTo(tgInfoLabel.snp.bottom).offset(28)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(70)
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
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(70)
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
        let right = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(goSettingVc))
        navigationItem.rightBarButtonItem = right
        navigationItem.hidesBackButton = true
        if let userName = UserDefaults.standard.string(forKey: "userName") {
            navigationItem.title = "\(userName)님의 다마고치"
        } else {
            navigationItem.title = viewType.navTitle
        }
        navigationController?.navigationBar.tintColor = UIColor.mainColor
        UINavigationBarAppearance().shadowColor = .lightGray
        navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
    }
    
    func setTGMainView() {
        if let t = self.tamagotchi {
            let rice = UserDefaults.standard.integer(forKey: "\(t.id) 밥알")
            UserDefaults.standard.set(rice, forKey: "\(t.id) 밥알")
            
            let water = UserDefaults.standard.integer(forKey: "\(t.id) 물")
            UserDefaults.standard.set(water, forKey: "\(t.id) 물")
            
            let level = Tamagotchi.setLevel(rice: rice, water: water)
            tgNameLabel.text = t.name
            tgInfoLabel.text = "Lv.\(level) | 밥알 \(rice)개 | 물방울 \(water)개"
            tgImageView.image = UIImage(named: Tamagotchi.setImage(id: t.id, level: level))
        }
    }
    
    @objc func goSettingVc() {
        let vc = SettingViewController()
        
        viewType = .setting
        vc.navigationItem.title = viewType.navTitle
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func raiseRice() {
        print("\(#function) 누름")
        
        if let t = self.tamagotchi, let riceStr = raiseRiceTF.text {
            let beforeRice = UserDefaults.standard.integer(forKey: "\(t.id) 밥알")
            print("더하기전 밥알", beforeRice)
            if riceStr.isEmpty {
               let afterRice = beforeRice + 1
                UserDefaults.standard.set(afterRice, forKey: "\(t.id) 밥알")
            } else {
                if let rice = Int(riceStr) {
                    if rice > 0 {
                        let afterRice = beforeRice + rice
                        UserDefaults.standard.set(afterRice, forKey: "\(t.id) 밥알")
                    } else {
                        raiseRiceTF.text = nil
                        raiseRiceTF.placeholder = "0 이상 입력 가능"
                    }
                }
            }
            print("더한 후 밥알", UserDefaults.standard.integer(forKey: "\(t.id) 밥알"))
        }
        
        setTGMainView()
        raiseRiceTF.text = nil
    }
    
    @objc func raiseWater() {
        print("\(#function) 누름")
        
        if let t = self.tamagotchi, let waterStr = raiseWaterTF.text {
            let beforeWater = UserDefaults.standard.integer(forKey: "\(t.id) 물")
            print("더하기전 물", beforeWater)
            if waterStr.isEmpty {
               let afterWater = beforeWater + 1
                User.user.tamagotchiList[t.id].water = afterWater
                UserDefaults.standard.set(afterWater, forKey: "\(t.id) 물")
            } else {
                if let water = Int(waterStr) {
                    if water > 0 {
                        let afterWater = beforeWater + water
                        User.user.tamagotchiList[t.id].water = afterWater
                        UserDefaults.standard.set(afterWater, forKey: "\(t.id) 물")
                    } else {
                        raiseWaterTF.text = nil
                        raiseWaterTF.placeholder = "0 이상 입력 가능"
                    }
                }
            }
            print("더한 후 물", UserDefaults.standard.integer(forKey: "\(t.id) 물"))
        }

        setTGMainView()
        raiseWaterTF.text = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let userName = UserDefaults.standard.string(forKey: "userName") {
            navigationItem.title = "\(userName)님의 다마고치"
        }
            
    }
}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            guard Int(text) == nil else {
                textField.placeholder = "숫자만 입력해주세요"
                return
            }
        }
    }
}
