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
    
    func testShouldCallStatusBarAppearanceUpdate() {
        sut.setNeedsStatusBarAppearanceUpdate()
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
        sut.showLoading()
        Goverment_ActivityIndicator.show(parent: sut.view)
        XCTAssertTrue(Goverment_ActivityIndicator.isLoading())
    }
    
    func testShouldRemoveLoading() {
        sut.dissmissLoading()
        Goverment_ActivityIndicator.remove(parent: sut.view)
        XCTAssertFalse(Goverment_ActivityIndicator.isLoading(), "Loading indicator should not be animating after dismissal")
    }
    
    func testShouldRegisterUser() {
        XCTAssertNotNil(sut.notifyRegisterUser(userInfo: UserInfo(userMail: "a", userPassword: "b")))
    }
    
    func testShouldLogInUser() {
        XCTAssertNotNil(sut.notifyCheckUserLogin(userInfo: UserInfo(userMail: "a", userPassword: "b")))
    }
    
    func testShouldLogInUserWithGoogle() {
        XCTAssertNotNil(sut.notifyCheckGoogleLogin())
    }
    
    func testNotifyLockInWithFaceBiometrics() {
        XCTAssertNotNil(sut.notifyLockInWithFaceBiometrics)
    }
    
    func testNotifyShowError() {
        XCTAssertNotNil(sut.notifyShowError(errorMessage: "error"))
    }
}
