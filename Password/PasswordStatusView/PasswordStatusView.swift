//
//  PasswordStatusView.swift
//  Password
//
//  Created by admin on 20/04/2023.
//

import Foundation
import UIKit

class PasswordStatusView: UIView {
    
    let stackView = UIStackView()
    let criterialLabel = UILabel()
    let lengthCriteriaView = PasswordCriteriaView(text: "8-32 characters (no spaces)")
    let upperCaseCriteriaView = PasswordCriteriaView(text: "uppercase letter (A-Z)")
    let lowerCaseCriteriaView = PasswordCriteriaView(text: "lowercase (a-z)")
    let digitCriteriaView = PasswordCriteriaView(text: "digit (0-9)")
    let specialCharacterCriteriaView = PasswordCriteriaView(text: "special character (e.g. !@#$%^)")
    
    var shouldResetCriteria: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 250)
    }
}

extension PasswordStatusView {
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        lengthCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        upperCaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        lowerCaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        digitCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        specialCharacterCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        criterialLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .tertiarySystemFill
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
//        stackView.backgroundColor = .systemRed
        stackView.distribution = .equalCentering
        
        criterialLabel.numberOfLines = 0
        criterialLabel.lineBreakMode = .byWordWrapping
        criterialLabel.attributedText = makeCriteriaMessage()
    }
    
    private func layout() {
        stackView.addArrangedSubview(lengthCriteriaView)
        stackView.addArrangedSubview(criterialLabel)
        stackView.addArrangedSubview(upperCaseCriteriaView)
        stackView.addArrangedSubview(lowerCaseCriteriaView)
        stackView.addArrangedSubview(digitCriteriaView)
        stackView.addArrangedSubview(specialCharacterCriteriaView)
        
        addSubview(stackView)
        
        //Stack Layout
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
//            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    
        // Hard coded heights
        let height: CGFloat = 20
        NSLayoutConstraint.activate([
            lengthCriteriaView.heightAnchor.constraint(equalToConstant: height),
            upperCaseCriteriaView.heightAnchor.constraint(equalToConstant: height),
            lowerCaseCriteriaView.heightAnchor.constraint(equalToConstant: height),
            digitCriteriaView.heightAnchor.constraint(equalToConstant: height),
            specialCharacterCriteriaView.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    private func makeCriteriaMessage() -> NSAttributedString {
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline, compatibleWith: .current)
        plainTextAttributes[.foregroundColor] = UIColor.secondaryLabel
        
        var boldTextAttrubutes = [NSAttributedString.Key: AnyObject]()
        boldTextAttrubutes[.foregroundColor] = UIColor.label
        boldTextAttrubutes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)
        
        let atrrText = NSMutableAttributedString(string: "Use at least",attributes: plainTextAttributes)
        atrrText.append(NSAttributedString(string: "3 of these 4", attributes: boldTextAttrubutes))
        atrrText.append(NSAttributedString(string: "criteria when setting your password:", attributes: plainTextAttributes))
        
        return atrrText
    }
}

extension PasswordStatusView {
    func updateDisplay(_ text: String) {
        let lengthAndNoSpaceMet = PasswordCriteria.lengthAndNoSpaceMet(text)
        let upperCaseMet = PasswordCriteria.uppercaseMet(text)
        let lowcaseMet = PasswordCriteria.lowercaseMet(text)
        let digitMet = PasswordCriteria.digitMet(text)
        let specialCharacterMet = PasswordCriteria.specialCharacterMet(text)
        
        if shouldResetCriteria {
            lengthAndNoSpaceMet ? lengthCriteriaView.isCriteriaMet = true : lengthCriteriaView.reset()
            upperCaseMet ? upperCaseCriteriaView.isCriteriaMet = true : upperCaseCriteriaView.reset()
            lowcaseMet ? lowerCaseCriteriaView.isCriteriaMet = true : lowerCaseCriteriaView.reset()
            digitMet ? digitCriteriaView.isCriteriaMet = true : digitCriteriaView.reset()
            specialCharacterMet ? specialCharacterCriteriaView.isCriteriaMet = true : specialCharacterCriteriaView.reset()
        } else {
            lengthCriteriaView.isCriteriaMet = lengthAndNoSpaceMet
            upperCaseCriteriaView.isCriteriaMet = upperCaseMet
            lowerCaseCriteriaView.isCriteriaMet = lowcaseMet
            digitCriteriaView.isCriteriaMet = digitMet
            specialCharacterCriteriaView.isCriteriaMet = specialCharacterMet
        }
    }
    
    func validate(_ text: String) -> Bool {
        let uppercaseMet = PasswordCriteria.uppercaseMet(text)
        let lowercaseMet = PasswordCriteria.lowercaseMet(text)
        let digiMet = PasswordCriteria.digitMet(text)
        let specialCharacterMet = PasswordCriteria.specialCharacterMet(text)
        
        //
        let checkable = [uppercaseMet, lowercaseMet, digiMet, specialCharacterMet]
        let metCriterial = checkable.filter { $0 }
        
        let lengthAndNoSpace = PasswordCriteria.lengthAndNoSpaceMet(text)
        
        print("--fo: \(metCriterial.count)")
            
        if lengthAndNoSpace && metCriterial.count >= 3 {
            return true
        }
        return false
    }
    
    func reset() {
        lengthCriteriaView.reset()
        upperCaseCriteriaView.reset()
        lowerCaseCriteriaView.reset()
        digitCriteriaView.reset()
        specialCharacterCriteriaView.reset()
    }
}
