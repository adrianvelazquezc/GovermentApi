//
//  GovermentLoginViewTest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentLoginViewTest: XCTestCase {
    var sut: GovermentLoginView!
    
    override func setUpWithError() throws {
        sut = GovermentLoginView()
        sut.view = UIView()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testShouldStart() {
        XCTAssertNotNil(sut.viewDidLoad())
    }
    
    func testShouldShowError() {
        let expectation = XCTestExpectation(description: "Waiting for the alert to be presented")
        sut.notifyError(error: "test1")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let presentedAlert = self.sut.view.subviews.compactMap { $0 as? Goverment_Alert }.first
            XCTAssertNotNil(presentedAlert, "The alert has not been presented")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4.0)
    }
    
    func testShouldShowLoading() {
        let testView = UIView()
        Goverment_ActivityIndicator.show(parent: testView)
        XCTAssertTrue(Goverment_ActivityIndicator.isLoading())
    }
    
    func testShouldRemoveLoading() {
        let testView = UIView()
        Goverment_ActivityIndicator.show(parent: testView)
        Goverment_ActivityIndicator.remove(parent: testView)
        XCTAssertFalse(Goverment_ActivityIndicator.isLoading(), "Loading indicator should not be animating after dismissal")
    }
    
    func testShouldRegisterUser() {
        sut.notifyRegisterUser(userInfo: UserInfo(userMail: "a", userPassword: "b"))
    }
    
    func testShouldLogInUser() {
        sut.notifyCheckUserLogin(userInfo: UserInfo(userMail: "a", userPassword: "b"))
    }
    
    func testShouldLogInUserWithGoogle() {
        sut.notifyCheckGoogleLogin()
    }
}
