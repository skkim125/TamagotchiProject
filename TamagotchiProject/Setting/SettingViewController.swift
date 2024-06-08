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
    var user: User?
    var viewType: ViewType = .setting
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
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.id, for: indexPath) as! SettingTableViewCell
        
        if settings[indexPath.row] == .changNicname {
            if let u = self.user {
                cell.detailTextLabel?.text = u.userName
            }
        }
        
        cell.setUI(setting: settings[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = settings[indexPath.row]
        
        switch setting {
        case .changNicname:
            let vc = ChangeNicknameViewController()
            if let u = self.user {
                vc.nicknameTF.placeholder = u.userName
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
                self.navigationController?.popToRootViewController(animated: true)
            }
            alert.addAction(cancel)
            alert.addAction(reset)
            
            present(alert, animated: true)
        }
    }
}
