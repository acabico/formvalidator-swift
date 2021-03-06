//
//  AlphanumericConditionTests.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

@testable import FormValidatorSwift


final class AlphanumericConditionTests: XCTestCase {
    
    
    // MARK: - Constants
    
    internal struct Constants {
        static let ascii = "abcDefgh1234567890"
        static let unicode = "abÅÄcdefÖgh1234567890"
        
        static let asciiSpaces = "abc Def gh1234 567890"
        static let unicodeSpaces = "abÅ Äcdef Ögh1234 567890"
        
        static let symbols = "a?!1"
    }
    
    
    // MARK: - Test Success
    
    func testAlphanumericCondition_NoUnicode_NoWhitespace_Success() {
        // Given
        let testInput       = Constants.ascii
        let condition       = AlphanumericCondition(allowsUnicode: false, allowsWhitespace: false)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericCondition_NoUnicode_Whitespace_Success() {
        // Given
        let testInput       = Constants.asciiSpaces
        let condition       = AlphanumericCondition(allowsUnicode: false, allowsWhitespace: true)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericCondition_Unicode_NoWhitespace_Success() {
        // Given
        let testInput       = Constants.unicode
        let condition       = AlphanumericCondition(allowsUnicode: true, allowsWhitespace: false)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericCondition_Unicode_Whitespace_Success() {
        // Given
        let testInput       = Constants.unicodeSpaces
        let condition       = AlphanumericCondition(allowsUnicode: true, allowsWhitespace: true)
        let expectedResult  = true
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    
    // MARK: - Test Failure
    
    func testAlphanumericCondition_NoUnicode_NoWhitespace_Failure_Spaces() {
        // Given
        let testInput       = Constants.asciiSpaces
        let condition       = AlphanumericCondition(allowsUnicode: false, allowsWhitespace: false)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericCondition_NoUnicode_NoWhitespace_Failure_Unicode() {
        // Given
        let testInput       = Constants.unicode
        let condition       = AlphanumericCondition(allowsUnicode: false, allowsWhitespace: false)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericCondition_NoUnicode_Whitespace_Failure_Symbols() {
        // Given
        let testInput       = Constants.symbols
        let condition       = AlphanumericCondition(allowsUnicode: false, allowsWhitespace: true)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericCondition_NoUnicode_Whitespace_Failure_Unicode() {
        // Given
        let testInput       = Constants.unicodeSpaces
        let condition       = AlphanumericCondition(allowsUnicode: false, allowsWhitespace: true)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericCondition_Unicode_NoWhitespace_Failure() {
        // Given
        let testInput       = Constants.unicodeSpaces
        let condition       = AlphanumericCondition(allowsUnicode: true, allowsWhitespace: false)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericCondition_Unicode_Whitespace_Failure() {
        // Given
        let testInput       = Constants.symbols
        let condition       = AlphanumericCondition(allowsUnicode: true, allowsWhitespace: true)
        let expectedResult  = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
    func testAlphanumericCondition_Nil() {
        // Given
        let testInput: String?  = nil
        let condition       = AlphanumericCondition()
        let expectedResult      = false
        
        // Test
        AssertCondition(condition, testInput: testInput, expectedResult: expectedResult)
    }
    
}
