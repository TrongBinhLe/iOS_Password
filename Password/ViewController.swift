//
//  ViewController.swift
//  Password
//
//  Created by admin on 19/04/2023.
//

import UIKit

class ViewController: UIViewController {
    typealias Customvalidation = PasswordTextField.CustomValidation
    
    let stackView = UIStackView()
    let newPasswordTextField = PasswordTextField(placeHolderText: "New password")
    let statusView = PasswordStatusView()
    let confirmPasswordTextField = PasswordTextField(placeHolderText: "Re-enter new password")
    let resetButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        style()
        layout()
    }

}

extension ViewController {
    
    private func setup() {
        setupNewPassword()
        setupDismissKeyboardGesture()
    }
    
    private func style() {
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        newPasswordTextField.delegate = self
        
        statusView.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        resetButton.configuration = .filled()
        resetButton.setTitle("Reset password", for: [])
    }
    
    private func layout() {
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(resetButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 16),
        ])
    }
    
    private func setupDismissKeyboardGesture() {
        let dimissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_: )))
        view.addGestureRecognizer(dimissKeyboardTap)
    }
    
    @objc func viewTapped(_ recognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    private func setupNewPassword() {
        let newPasswordValidation: Customvalidation = { text in
            //Empty text
            guard let text = text, !text.isEmpty else {
                self.statusView.reset()
            return (false, "Enter your password")
            }
            return (true,"")
        }
        
        newPasswordTextField.customValidation = newPasswordValidation
    }
    
}

extension ViewController: PasswordTextFieldDelegate {
    func editingChanged(_ sender: PasswordTextField) {
        if sender === newPasswordTextField {
            statusView.updateDisplay(sender.textField.text ?? "")
        }
    }
    
    func editingDidEnd(_ sender: PasswordTextField) {
        if sender === newPasswordTextField {
            _ = newPasswordTextField.validate()
        }
    }
    
}
