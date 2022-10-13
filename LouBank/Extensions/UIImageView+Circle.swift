//
//  UIImageView+Circle.swift
//  LouBank
//
//  Created by Alexander Chervoncev on 12.10.22.
//

import UIKit

extension UIImageView {
    
    // Создание круглой иконки 
    func makeRounded() {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
