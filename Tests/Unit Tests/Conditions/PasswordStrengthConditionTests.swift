//
//  PasswordStrengthConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class PasswordStrengthConditionTests: XCTestCase {
    
    
    // MARK: - Test Success
    
    func testPasswordStrengthCondition_VeryWeak_Success() {
        // Given
        let testInput       = "Foo"
        let condition       = PasswordStrengthCondition(requiredStrength: .VeryWeak)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testPasswordStrengthCondition_VeryStrong_Success() {
        // Given
        let testInput       = "F1@b9a_c12983y"
        let condition       = PasswordStrengthCondition(requiredStrength: .VeryStrong)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testPasswordStrengthCondition_VeryStrong_Failure() {
        // Given
        let testInput       = "Foo"
        let condition       = PasswordStrengthCondition(requiredStrength: .VeryStrong)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }

}