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
        XCTAssertNotNil(sut.responseNewUserLogin())
    }
    
    func testShouldCallRequestUserLogin() {
        XCTAssertNotNil(sut.requestUserLogin(userInfo: userInfoMock))
    }
    
    func testShouldCallResponseUserLogin() {
        XCTAssertNotNil(sut.responseUserLogin())
    }
    
    func testShouldCallRequestCheckGoogleLogin() {
        XCTAssertNotNil(sut.requestCheckGoogleLogin(present: UIViewController()))
    }
    
    func testShouldCallResponseCheckGoogleLogin() {
        XCTAssertNotNil(sut.responseCheckGoogleLogin())
    }
    
    func testShouldCallResponseErrorInfo() {
        XCTAssertNotNil(sut.responseErrorInfo(error: "error"))
    }

}
