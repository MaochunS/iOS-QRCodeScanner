//
//  UIButton+Extension.swift
//  iOS_CarrefourFastShipping
//
//  Created by maochun on 2022/3/26.
//

import UIKit

extension UIButton {

    func setBackgroundColor(color: UIColor, forState: UIControl.State) {

        let minimumSize: CGSize = CGSize(width: 1.0, height: 1.0)

        UIGraphicsBeginImageContext(minimumSize)

        if let context = UIGraphicsGetCurrentContext() {
          context.setFillColor(color.cgColor)
          context.fill(CGRect(origin: .zero, size: minimumSize))
        }

        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        self.clipsToBounds = true
        self.setBackgroundImage(colorImage, for: forState)
    }
}
