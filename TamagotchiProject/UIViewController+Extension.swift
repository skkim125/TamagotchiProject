//
//  UIView+Extension.swift
//  TamagotchiProject
//
//  Created by 김상규 on 6/13/24.
//

import UIKit

extension UIViewController {
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(keyboardDismiss))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardDismiss() {
        view.endEditing(true)
    }
}
