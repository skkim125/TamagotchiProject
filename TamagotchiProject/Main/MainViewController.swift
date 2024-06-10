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
        imgView.contentMode = .scaleToFill
        
        return imgView
    }()
    
    lazy var bubbleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mainColor
        label.text = "비비디바비디부 비비디바비디부 비비디바비디부 비비디바비디부 비비디바비디부"
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
        tf.keyboardType = .numberPad
        
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
        tf.keyboardType = .numberPad
        
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
    let uDM = UserDefaultsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureHierarchy()
        configureLayout()
        configureNavigationView()
        configureMainVIewUI()
        tapGesture()
    }
    
    func configureHierarchy() {
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
            make.top.lessThanOrEqualTo(view.safeAreaLayoutGuide).offset(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(80)
            make.height.equalTo(160)
        }
        
        bubbleLabel.snp.makeConstraints { make in
            make.edges.equalTo(bubbleImgView)
        }
        
        tgImageView.snp.makeConstraints { make in
            make.top.equalTo(bubbleImgView.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(bubbleImgView)
            make.height.equalTo(160)
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
            make.bottom.equalTo(view.keyboardLayoutGuide.snp.top) // keyboardLayoutGuide에 맞춰 레이아웃이 설정됨
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
        navigationItem.title = "\(uDM.loadUserName())님의 다마고치"
        navigationController?.navigationBar.tintColor = UIColor.mainColor
        UINavigationBarAppearance().shadowColor = .lightGray
        navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
    }
    
    func configureMainVIewUI() {
        if let t = self.tamagotchi {
            let rice = uDM.loadTgRice(tgID: t.id)
            let water = uDM.loadTgWater(tgID: t.id)
            let level = Tamagotchi.setLevel(rice: rice, water: water)
            
            tgNameLabel.text = t.name
            tgInfoLabel.text = "Lv.\(level) | 밥알 \(rice)개 | 물방울 \(water)개"
            tgImageView.image = UIImage(named: Tamagotchi.setImage(id: t.id, level: level))
        }
    }
    
    @objc func goSettingVc() {
        let vc = SettingViewController()
        view.endEditing(true)
        viewType = .setting
        vc.navigationItem.title = viewType.navTitle
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func raiseRice() {
        
        if let t = self.tamagotchi, let riceStr = raiseRiceTF.text {
            let beforeRice = uDM.loadTgRice(tgID: t.id)
            if riceStr.isEmpty {
               let afterRice = beforeRice + 1
                uDM.saveTgRice(tgID: t.id, rice: afterRice)
            } else {
                if let rice = Int(riceStr) {
                    if rice > 0 {
                        let afterRice = beforeRice + rice
                        uDM.saveTgRice(tgID: t.id, rice: afterRice)
                    } else {
                        raiseRiceTF.text = nil
                        raiseRiceTF.placeholder = "0 이상 입력 가능"
                    }
                } else {
                    raiseRiceTF.text = nil
                    raiseRiceTF.placeholder = "정수만 입력 가능"
                }
            }
        }
        
        configureMainVIewUI()
        raiseRiceTF.text = nil
    }
    
    @objc func raiseWater() {
        
        if let t = self.tamagotchi, let waterStr = raiseWaterTF.text {
            
            let beforeWater = uDM.loadTgWater(tgID: t.id)
            if waterStr.isEmpty {
               let afterWater = beforeWater + 1
                uDM.saveTgWater(tgID: t.id, water: afterWater)
            } else {
                if let water = Int(waterStr) {
                    if water > 0 {
                        let afterWater = beforeWater + water
                        uDM.saveTgWater(tgID: t.id, water: afterWater)
                    } else {
                        raiseWaterTF.text = nil
                        raiseWaterTF.placeholder = "0 이상 입력 가능"
                    }
                } else {
                    raiseWaterTF.text = nil
                    raiseWaterTF.placeholder = "정수만 입력 가능"
                }
            }
        }

        configureMainVIewUI()
        raiseWaterTF.text = nil
    }
    
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(keyboardDismiss))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardDismiss() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "\(uDM.loadUserName())님의 다마고치"
    }
}
