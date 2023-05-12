//
//  PasswordCriteriaTests.swift
//  PasswordTests
//
//  Created by admin on 10/05/2023.
//

import Foundation
import XCTest

@testable import Password

class PasswordLengthCriteriaTests: XCTestCase {
    
    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteria("12312"))
    }
    
    func testLong() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteria("123456789012345678901234567890123"))
    }
        
    func testValidShort() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteria("12345678"))
    }

    func testValidLong() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteria("12345678901234567890123456789012"))
    }

}

class PasswordOtherCriteriaTests: XCTestCase {
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteria("abc"))
    }
    
    func testSpaceNoMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteria("ab c"))
    }
    func testlengthAndNoSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.lengthAndNoSpaceMet("12345678"))
    }
    
    func testlengthAndNoSpaceNoMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("1234567 8"))
    }
    
    func testUpperCaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("323Adsf"))
    }
    func testUpperCaseNoMet() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("2342wssffq"))
    }
    
    func testlowerCaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("werewedf3eSF"))
    }
    
    func testlowerCaseNoMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("SDFNNND"))
    }
    
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("2342ERer"))
    }
    
    func testDigitNoMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("HSsdfasdfsfa"))
    }
    
//    func testSpecialCharacterMet() throws {
//        XCTAssertTrue(PasswordCriteria.specialCharacterMet("@"))
//    }
    
    func testSpecialCharaterNoMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet("asdaf"))
    }
    
}
