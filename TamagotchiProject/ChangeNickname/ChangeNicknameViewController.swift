//
//  ChangeNicknameViewController.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/7/24.
//

import UIKit
import SnapKit

class ChangeNicknameViewController: UIViewController {
    
    lazy var nicknameTF: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        let spacing = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 0))
        tf.leftView = spacing
        tf.leftViewMode = .always
        tf.rightView = spacing
        tf.rightViewMode = .always
        
        return tf
    }()
    
    lazy var nicknameTFDivider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.mainColor
        
        return view
    }()
    
    let udm = UserDefaultsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureHierarchy()
        configureLayout()
        configureNavigationView()
        configureTF()
        tapGesture()
    }
    
    func configureHierarchy() {
        view.addSubview(nicknameTF)
        view.addSubview(nicknameTFDivider)
    }
    
    func configureLayout() {
        nicknameTF.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(36)
        }
        
        nicknameTFDivider.snp.makeConstraints { make in
            make.bottom.equalTo(nicknameTF.snp.bottom)
            make.horizontalEdges.equalTo(nicknameTF)
            make.height.equalTo(2)
        }
    }
    
    func configureNavigationView() {
        let save = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        navigationItem.rightBarButtonItem = save
    }
    
    func configureTF() {
        nicknameTF.placeholder = udm.loadUserName()
    }
    
    @objc func saveButtonClicked() {
        
        if let text = self.nicknameTF.text, !text.isEmpty {
            udm.saveUserName(userName: text)
            User.userName = text
            
        } else {
            if let placeholder = nicknameTF.placeholder {
                udm.saveUserName(userName: placeholder)
            }
        }
        
        view.endEditing(true)
        self.navigationController?.popViewController(animated: true)
    }
}
