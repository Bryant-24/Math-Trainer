//
//  UIButton+Shadow.swift
//  Math-Trainer
//
//  Created by Ruslan Galiev on 4/3/23.
//

import UIKit

extension UIButton {
    func addShadow() {
        self.layer.backgroundColor = UIColor.systemYellow.cgColor
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 3.0
    }
}
