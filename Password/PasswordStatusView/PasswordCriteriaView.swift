//
//  PasswordCriteriaView.swift
//  Password
//
//  Created by admin on 19/04/2023.
//

import Foundation
import UIKit

class PasswordCriteriaView: UIView {
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    let checkmarkImage = UIImage(systemName: "checkmark.circle")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    let xmarkImage = UIImage(systemName: "xmark.circle")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
    let circleImage = UIImage(systemName: "circle")?.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
    
    var isCriteriaMet: Bool = false {
        didSet {
            if isCriteriaMet {
                imageView.image = checkmarkImage
            } else {
                imageView.image = xmarkImage
            }
        }
    }
    
    func reset() {
        isCriteriaMet = false
        imageView.image = circleImage
    }
    
    init(text: String) {
        label.text = text
        super.init(frame: .zero)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 40)
    }
}

extension PasswordCriteriaView {
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        
//        backgroundColor = .systemRed
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "circle")?.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
//        label.text = "uppercase letter (A-Z)"
    }
    
    private func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        addSubview(stackView)
        //stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        //imageView
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
        
        //CHCR
        
        imageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
    }
}



// MARK: Tests
extension PasswordCriteriaView {
    var isCheckMarkImage: Bool {
        return imageView.image == checkmarkImage
    }
    
    var isXmarkImage: Bool {
        return imageView.image == xmarkImage
    }
    
    var isResetImage: Bool {
        return imageView.image == circleImage
    }
}
