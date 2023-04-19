//
//  ViewController.swift
//  Password
//
//  Created by admin on 19/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let newPasswordTextField = PasswordTextField(placeHolderText: "New password")

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
            newPasswordTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: newPasswordTextField.trailingAnchor, multiplier: 1),
            newPasswordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
