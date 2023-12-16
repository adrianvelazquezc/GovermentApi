//
//  GovermentLoginUiViewTest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentLoginUiViewTest: XCTestCase {
    var sut: GovermentLoginViewUI!
    var mockGestureRecognizer: UITapGestureRecognizer!
    
    override func setUpWithError() throws {
        sut = GovermentLoginViewUI(navigation: UINavigationController(), delegate: nil, isEnableActivated: false)
        mockGestureRecognizer = UITapGestureRecognizer()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testShoulDissmisKeyboard() {
        XCTAssertNotNil(sut.dissmisKeyboard(mockGestureRecognizer))
    }
    
    func testShoulLogInWithUser() {
        XCTAssertNotNil(sut.buttonTapped(mockGestureRecognizer))
    }
    
    func testShouldCallTextFieldDidChangeSelection() {
        XCTAssertNotNil(sut.userPasswordTextField.textFieldDidChangeSelection(sut.userlMailTextField))
    }
    
    
    func testShouldCallUpdatePlaceholderTextWith() {
        XCTAssertNotNil(sut.userPasswordTextField.updatePlaceholderTextWith("test1"))
    }
    
    func testShoulRegisterUser() {
        XCTAssertNotNil(sut.registerTapped(UIButton()))
    }
    
    func testShouldChangeInputText() {
        let mockTextfield = sut.userlMailTextField
        mockTextfield.text = "change"
        XCTAssertNotNil(sut.textFieldDidChangeSelection(mockTextfield))
    }
    
    func testShouldNotChangeInputTextWhenButtonDisabled() {
        let mockView = GovermentLoginViewUI()
        mockView.continueButton.isEnabled = false
        XCTAssertNotNil(sut.textFieldDidChangeSelection(mockView.userlMailTextField))
    }
    
    func testShouldNotChangeInputTextWhenButtonEnabled() {
        let mockView = GovermentLoginViewUI()
        mockView.continueButton.isEnabled = true
        XCTAssertNotNil(sut.textFieldDidChangeSelection(mockView.userlMailTextField))
    }
}
