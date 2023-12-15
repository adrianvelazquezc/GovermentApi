//
//  GovermentSplashTest.swift
//  GovermentApiTests
//
//  Created by Mac on 12/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentSplashTest: XCTestCase {
    var sut: GovermentSplashView!
    
    override func setUpWithError() throws {
        sut = GovermentSplashView()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testShouldStart() {
        let expectation = XCTestExpectation(description: "ViewDidLoad")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            XCTAssertNotNil(self.sut.viewDidLoad())
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 6.0)
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
        XCTAssertTrue(Goverment_ActivityIndicator.isLoading())
    }
    
    func testShouldRemoveLoading() {
        let testView = UIView()
        Goverment_ActivityIndicator.show(parent: testView)
        Goverment_ActivityIndicator.remove(parent: testView)
        XCTAssertFalse(Goverment_ActivityIndicator.isLoading(), "Loading indicator should not be animating after dismissal")
    
    }
    
    func testShouldAccept() {
        let alert = Goverment_Alert(parentView: sut.view, delegate: sut, title: "Error", message: "test1", btnAcceptTitle: "Retry")
        alert.show()
        let initialViews = alert.parentView?.subviews
        alert.hideAlertView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let endViews = alert.parentView?.subviews
            XCTAssertNotEqual(initialViews, endViews, "Expected subviews to change after hideAlertView")
        }
    }


    func testShouldCancel() {
        let alert = Goverment_Alert(parentView: sut.view, delegate: sut, title: "Error", message: "test2", btnAcceptTitle: "Retry")
        alert.show()
        let initialViews = alert.parentView?.subviews
        alert.continueAction(UIButton())
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let endViews = alert.parentView?.subviews
            XCTAssertNotEqual(initialViews, endViews, "Expected subviews to change after continueAction")
        }
    }
}
