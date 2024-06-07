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
        let layout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.width / 3)-8
        layout.itemSize = CGSize(width: width, height: width)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(SelectTGCollectionViewCell.self, forCellWithReuseIdentifier: SelectTGCollectionViewCell.id)
        cv.contentInset = .init(top: 1, left: 1, bottom: 1, right: 1)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        
        
        return cv
    }()
    
    var user: User = User(userName: "대장님")
    var tamagotchi: Tamagotchi?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "다마고치 선택하기"
        configureHierarchy()
        configureLayout()
    }
    
    func configureHierarchy() {
        // MARK: addSubView()
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


extension SelectTGViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectTGCollectionViewCell.id, for: indexPath) as! SelectTGCollectionViewCell
        
        for i in 0...user.tamagotchiList.count-1 {
            if i == indexPath.row {
                cell.tamagotchi = user.tamagotchiList[i]
                cell.setLabelText(data: user.tamagotchiList[i])
            }
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let cell = collectionView.cellForItem(at: indexPath) as! SelectTGCollectionViewCell
        let vc = SelectPresentViewController()
        guard let t = cell.tamagotchi else { return }
        vc.tamagotchi = t
        vc.setSelectTGView()
        present(vc, animated: true)
    }
}
