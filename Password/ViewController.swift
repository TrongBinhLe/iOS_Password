//
//  ViewController.swift
//  Password
//
//  Created by admin on 19/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let newPasswordTextField = PasswordTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        style()
        layout()
        
    }

}

extension ViewController {
    
    private func style() {
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(newPasswordTextField)
        
        NSLayoutConstraint.activate([
            newPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newPasswordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
