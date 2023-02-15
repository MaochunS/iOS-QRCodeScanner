//
//  ScanAnimationView.swift
//  PushNotificationTest
//
//  Created by maochun on 2022/10/27.
//

import UIKit

class ScanAnimationView: UIImageView {

    var isAnimationing = false
    var animationRect = CGRect.zero

    func startAnimatingWithRect(animationRect: CGRect, parentView: UIView) {
        self.image = UIImage(named: "qrcode_scan_light_green")
        self.animationRect = animationRect
        parentView.addSubview(self)

        isHidden = false
        isAnimationing = true

        if image != nil {
            makeAnimation()
        }
    }

    @objc func makeAnimation() {
        guard isAnimationing else {
            return
        }
        var frame = animationRect

        let hImg = image!.size.height * animationRect.size.width / image!.size.width

        frame.origin.y -= hImg
        frame.size.height = hImg
        self.frame = frame

        alpha = 0.0

        UIView.animate(withDuration: 1.5, animations: {
            self.alpha = 1.0

            var frame = self.animationRect
            let hImg = self.image!.size.height * self.animationRect.size.width / self.image!.size.width

            frame.origin.y += (frame.size.height - hImg)
            frame.size.height = hImg
            
            self.frame = frame

        }, completion: { _ in
            self.perform(#selector(self.makeAnimation), with: nil, afterDelay: 0.3)
        })
    }

    func stopStepAnimating() {
        isHidden = true
        isAnimationing = false
    }
}
