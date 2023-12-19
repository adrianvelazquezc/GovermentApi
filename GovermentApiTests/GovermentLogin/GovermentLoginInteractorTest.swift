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
    var networkManagerMock: Goverment_LoginNetworkManagerMock!
    
    override func setUpWithError() throws {
        networkManagerMock = Goverment_LoginNetworkManagerMock()
        sut = GovermentLoginInteractor(authenticationManager: networkManagerMock)
        userInfoMock = UserInfo(userMail: "ab@test.com", userPassword: "123456")
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testShouldCallLoginUser() {
        XCTAssertNotNil(sut.authenticateUserLogin(userInfo: userInfoMock))
    }
    
    func testShouldCallPostNewUser() {
        XCTAssertNotNil(sut.postNewUser(userInfo: userInfoMock))
    }
    
    func testShouldCallAuthenticateFaceBiometricsLogin() {
        XCTAssertNotNil(sut.authenticateFaceBiometricsLogin())
    }
    
    func testShouldCallFetchLognInWithGoogle(){
        XCTAssertNotNil(sut.fetchLognInWithGoogle(present: UIViewController(), clientID: nil))
    }
    
    func testShouldCallLoginUserWithError() {
        networkManagerMock.authenticationSuccess = false
        XCTAssertNotNil(sut.authenticateUserLogin(userInfo: userInfoMock))
    }
    
    func testShouldCallPostNewUserWithError() {
        networkManagerMock.authenticationSuccess = false
        XCTAssertNotNil(sut.postNewUser(userInfo: userInfoMock))
    }
    
    func testShouldCallAuthenticateFaceBiometricsLoginWithError() {
        networkManagerMock.authenticationSuccess = false
        XCTAssertNotNil(sut.authenticateFaceBiometricsLogin())
    }
    
    func testShouldCallFetchLognInWithGoogleWithError(){
        networkManagerMock.authenticationSuccess = false
        XCTAssertNotNil(sut.fetchLognInWithGoogle(present: UIViewController(), clientID: nil))
    }
}
