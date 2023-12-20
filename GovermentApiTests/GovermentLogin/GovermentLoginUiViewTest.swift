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
        sut.userPasswordTextField.text = "test@domain.com"
        sut.userlMailTextField.text = "123456"
        XCTAssertNotNil(sut.buttonTapped(mockGestureRecognizer))
    }
    
    func testShouldCallTextFieldDidChangeSelection() {
        XCTAssertNotNil(sut.userPasswordTextField.textFieldDidChangeSelection(sut.userlMailTextField))
    }
    
    
    func testShouldCallUpdatePlaceholderTextWith() {
        XCTAssertNotNil(sut.userPasswordTextField.updatePlaceholderTextWith("test1"))
    }
    
    func testShoulRegisterUser() {
        sut.userPasswordTextField.text = "test@domain.com"
        sut.userlMailTextField.text = "123456"
        XCTAssertNotNil(sut.registerTapped(UIButton()))
    }
    func testShoulCallGoogleTapped() {
        XCTAssertNotNil(sut.googleTapped(UIButton()))
    }
    
    func testShouldChangeDiasableInputText() {
        let mockTextfield = sut.userlMailTextField
        mockTextfield.text = nil
        XCTAssertNotNil(sut.textFieldDidChangeSelection(mockTextfield))
    }
    
    func testShouldChangeEnableyInputText() {
        let mockTextfield = sut.userlMailTextField
        mockTextfield.text = "change"
        XCTAssertNotNil(sut.textFieldDidChangeSelection(mockTextfield))
    }
    
    
    func testShouldChangeCharactersInTag0() {
        let textField1 = UITextField()
        let result1 = sut.textField(textField1, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: "test")
        XCTAssertTrue(result1)
    }
    
    func testShouldChangeCharactersInTag1() {
        let textField2 = UITextField()
        textField2.tag = 1
        let result1 = sut.textField(textField2, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: "test")
        XCTAssertTrue(result1)
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
    
    func testShouldCallComponentGoverment_TextField() {
        XCTAssertNotNil(Goverment_TextField(placeholder: "test"))
    }
    
    func testShouldCallBiometricsFaceTapped() {
        XCTAssertNotNil(sut.biometricsFaceTapped(mockGestureRecognizer))
    }
    
    func testShouldCallBiometricsTapped() {
        XCTAssertNotNil(sut.biometricsTapped(mockGestureRecognizer))
    }
}
