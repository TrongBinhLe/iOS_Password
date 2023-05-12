//
//  PasswordStatusViewTests.swift
//  PasswordTests
//
//  Created by admin on 12/05/2023.
//

import Foundation
import XCTest

@testable import Password

class PasswordStatusViewTests_ShowCheckmarkOrReset_When_Validation_Is_Inline: XCTestCase {
    
    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let toShortPassword = "123"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = true
    }
    
    func testsValidPassword() {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage)
    }
}
