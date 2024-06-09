//
//  SettingViewController.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/7/24.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController {
    let settings: [SettingType] = [.changNicname,.changeTG,.reset]
    var viewType: ViewType = .setting
    var userName: String?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.id)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .zero
        tableView.isScrollEnabled = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureHierarchy()
        configureLayout()
        configureNavigationView()
    }
    
    func configureHierarchy() {
        // MARK: addSubView()
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view)
        }
    }
    
    func configureNavigationView() {
        let back = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonClicked))
        navigationItem.leftBarButtonItem = back
    }
    
    @objc func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userName = UserDefaults.standard.string(forKey: "userName")
        tableView.reloadData()
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.id) as! SettingTableViewCell
        
        if settings[indexPath.row] == .changNicname {
            cell.detailTextLabel?.text = userName
        } else {
            cell.detailTextLabel?.text = nil
        }
        
        cell.setUI(setting: settings[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = settings[indexPath.row]
        
        switch setting {
        case .changNicname:
            let vc = ChangeNicknameViewController()
            if let userName = UserDefaults.standard.string(forKey: "userName") {
                vc.nicknameTF.placeholder = userName
            }
            viewType = .changeNicname
            vc.navigationItem.title = viewType.navTitle
            navigationController?.pushViewController(vc, animated: true)
            
        case .changeTG:
            let vc = SelectTGViewController()
            vc.viewType = .changeTG
            vc.navigationItem.title = viewType.navTitle
            navigationController?.pushViewController(vc, animated: true)
            
        case .reset:
            let alert = UIAlertController(title: "데이터 초기화", message: "정말로 초기화하시겠습니까?", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "아니요", style: .cancel)
            let reset = UIAlertAction(title: "네", style: .destructive) { _ in
                UserDefaults.standard.set(false, forKey: "first_Reset")
                self.removeUDAll()
                let vc = SelectTGViewController()
                vc.navigationItem.hidesBackButton = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
            alert.addAction(cancel)
            alert.addAction(reset)
            
            present(alert, animated: true)
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func removeUDAll() {
        var list = User.user.tamagotchiList
        
        for i in 0...list.count-1 {
            print(list[i].id)
            list[i].rice = 0
            list[i].water = 0
            UserDefaults.standard.removeObject(forKey: "\(list[i].id) 밥알")
            UserDefaults.standard.removeObject(forKey: "\(list[i].id) 물")
            UserDefaults.standard.removeObject(forKey: "first_Reset")
            UserDefaults.standard.removeObject(forKey: "lastTgID")
            UserDefaults.standard.removeObject(forKey: "userName")
        }
    }
}
