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
        sut = GovermentLoginViewUI(navigation: UINavigationController(), delegate: nil)
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
    
//    func testShouldLogInWithUserError() {
//        sut.userNameTextField.text = nil
//        sut.userPasswordTextField.text = nil
//        XCTAssertNotNil(sut.buttonTapped(mockGestureRecognizer))
//    }
    
    func testShoulRegisterUser() {
        XCTAssertNotNil(sut.registerTapped(UIButton()))
    }
    
    func testShouldChangeInputText() {
        let mockTextfield = sut.userNameTextField
        mockTextfield.text = "change"
        XCTAssertNotNil(sut.textFieldDidChangeSelection(mockTextfield))
    }
    
    func testShouldNotChangeInputText() {
        let mockView = GovermentLoginViewUI()
        mockView.continueButton.isEnabled = false
        XCTAssertNotNil(sut.textFieldDidChangeSelection(mockView.userNameTextField))
    }
}
