//
//  SelectTGViewController.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/7/24.
//

import UIKit
import SnapKit

class SelectTGViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        cv.register(SelectTGCollectionViewCell.self, forCellWithReuseIdentifier: SelectTGCollectionViewCell.id)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        
        
        return cv
    }()
    
    
    func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let sectionSpacing: CGFloat = 2
        let cellSpacing: CGFloat = 2
        let width = UIScreen.main.bounds.width - (sectionSpacing * 2 + cellSpacing * 2)
        
        layout.itemSize = CGSize(width: width/3, height: width/3 * 1.3)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.sectionInset = .init(top: 2, left: 2, bottom: 2, right: 2)
        
        return layout
    }
    
    var tamagotchi: Tamagotchi?
    var viewType: ViewType = .selectTG
    let uDM = UserDefaultsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        uDM.saveUserName(userName: User.userName)
        configureHierarchy()
        configureLayout()
        configureNavigationView()
    }
    
    func configureHierarchy() {
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view)
        }
    }
    
    func configureNavigationView() {
        navigationItem.title = viewType.navTitle
    }
}


extension SelectTGViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectTGCollectionViewCell.id, for: indexPath) as! SelectTGCollectionViewCell
        let list = User.user.tamagotchiList
        
        for i in 0...list.count-1 {
            if i == indexPath.row {
                cell.tamagotchi = list[i]
                cell.setLabelText(data: list[i])
            } else {
                cell.isSelected = false
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SelectTGCollectionViewCell
        guard let t = cell.tamagotchi else { return }
        viewSetting(tamagotchi: t)
    }
    
    func viewSetting(tamagotchi: Tamagotchi) {
        let vc = SelectTGDetailViewController()
        vc.viewType = self.viewType
        vc.tamagotchi = tamagotchi
        vc.setSelectTGView()
        present(vc, animated: true)
    }
}
