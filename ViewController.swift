//
//  ViewController.swift
//  QRCodeScanner
//
//  Created by maochun on 2023/2/10.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var scanButton:  UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        btn.backgroundColor = .blue
        btn.setBackgroundColor(color: .black, forState: .highlighted)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.gray, for: .disabled)
        btn.setTitle(NSLocalizedString("Scan Button", comment: ""), for: .normal)
        btn.addTarget(self, action: #selector(scanAction), for: .touchUpInside)
        btn.layer.cornerRadius = 28

        self.view.addSubview(btn)
        NSLayoutConstraint.activate([
            btn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            btn.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, constant: -16*2),
            btn.heightAnchor.constraint(equalToConstant: 60)
        ])
       
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .gray
        _ = self.scanButton
    }

    @objc func scanAction(){
        let vc = ScannerViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: ScannerViewControllerDelegate{
    func scanResult(info: String) {
        //Handle QR code info here
        print("QRCode: \(info)")
        
        let alert = UIAlertController(title: "Info:", message: info, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}

