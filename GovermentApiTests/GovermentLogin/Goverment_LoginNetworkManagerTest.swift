//
//  Goverment_LoginNetworkManagerTest.swift
//  GovermentApiTests
//
//  Created by Mac on 19/12/23.
//

import XCTest
@testable import GovermentApi

final class Goverment_LoginNetworkManagerTest: XCTestCase {
    var sut: Goverment_LoginNetworkManager!
    
    override func setUpWithError() throws {
        sut = Goverment_LoginNetworkManager()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testShouldCallCreateUser() {
        let expectation = XCTestExpectation(description: "Create user expectation")

        sut.createUser(withEmail: "bc@test.com", password: "123456") { success, error in
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    
    func testShouldCallSignIn() {
        let expectation = XCTestExpectation(description: "Sign in expectation")

        sut.signIn(withEmail: "bc@test.com", password: "123456") { success, error in
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testShouldCallSignInWithGoogle() {
        XCTAssertNotNil(sut.signInWithGoogle(clientID: nil, presenting: UIViewController(), completion: { success, error in
        }))
    }

    
    func testShouldCallSignInWithBiometrics() {
        XCTAssertNotNil(sut.signInWithBiometrics { success, error in
        })
    }
}
