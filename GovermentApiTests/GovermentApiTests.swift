//
//  GovermentApiTests.swift
//  GovermentApiTests
//
//  Created by Mac on 12/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentApiTests: XCTestCase {
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
        XCTAssertNotNil(sut.notifyError(error: "prueba1"))
    }
    
    func testShouldShowLoading() {
        XCTAssertNotNil(sut.showLoading())
    }
    
    func testShouldRemoveLoading() {
        XCTAssertNotNil(sut.dissmissLoading())
    }
    
    func testShouldAccept() {
        XCTAssertNotNil(sut.notifyAccept())
    }
    
    func testShouldCancel() {
        XCTAssertNotNil(sut.notifyCancel())
    }
}
