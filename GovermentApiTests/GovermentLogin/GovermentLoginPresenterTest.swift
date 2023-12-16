//
//  GovermentLoginPresenterTest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentLoginPresenterTest: XCTestCase {
    var sut: GovermentLoginPresenter!
    var userInfoMock: UserInfo!

    override func setUpWithError() throws {
        sut = GovermentLoginPresenter()
        userInfoMock = UserInfo(userMail: "a", userPassword: "b")
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testShouldCallRequestNewUserLogin() {
        XCTAssertNotNil(sut.requestNewUserLogin(userInfo: userInfoMock))
    }
    
    func testShouldCallResponseNewUserLogin() {
        XCTAssertNotNil(sut.responseNewUserLogin(userInfo: userInfoMock))
    }
    
    func testShouldCallRequestUserLogin() {
        XCTAssertNotNil(sut.requestUserLogin(userInfo: userInfoMock))
    }
    
    func testShouldCallResponseUserLogin() {
        XCTAssertNotNil(sut.responseUserLogin(userInfo: userInfoMock))
    }
    
    func testShouldCallRequestCheckGoogleLogin() {
        XCTAssertNotNil(sut.requestCheckGoogleLogin(present: UIViewController()))
    }
    
    func testShouldCallResponseCheckGoogleLogin() {
        XCTAssertNotNil(sut.responseCheckGoogleLogin(clientID: "123456"))
    }
    
    func testShouldCallResponseErrorInfo() {
        XCTAssertNotNil(sut.responseErrorInfo(error: "error"))
    }
    
    func testShouldCallResponseLoginWithFaceBiometrics() {
        XCTAssertNotNil(sut.responseLoginWithFaceBiometrics())
    }
    
    func testShouldCallRequestLoginWithFaceBiometrics() {
        XCTAssertNotNil(sut.requestLoginWithFaceBiometrics(present: UIViewController()))
    }
    

}
