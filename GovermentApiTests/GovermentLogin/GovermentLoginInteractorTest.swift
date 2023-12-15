//
//  GovermentLoginInteractorTest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentLoginInteractorTest: XCTestCase {
    var sut: GovermentLoginInteractor!
    var userInfoMock: UserInfo!
    
    override func setUpWithError() throws {
        sut = GovermentLoginInteractor()
        userInfoMock = UserInfo(userMail: "ab@test.com", userPassword: "123456")
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testShouldCallPostNewUser() {
        XCTAssertNotNil(sut.postNewUser(userInfo: userInfoMock))
    }
    
    func testShouldCallAuthenticateUserLogin() {
        XCTAssertNotNil(sut.authenticateUserLogin(userInfo: userInfoMock))
    }
    
    func testShouldCallFetchLognInWithGoogle() {
        XCTAssertNotNil(sut.fetchLognInWithGoogle(present: UIViewController()))
    }
}
