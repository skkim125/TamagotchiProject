//
//  IdentifierProtocol.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/7/24.
//

import UIKit

protocol IdentifierProtocol {
    static var id: String { get }
}

extension UICollectionViewCell: IdentifierProtocol {
    static var id: String {
        String(describing: self)
    }
}

extension UITableViewCell: IdentifierProtocol {
    static var id: String {
        String(describing: self)
    }
}
