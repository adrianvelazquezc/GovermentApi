//
//  GovermentHomeViewTest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentHomeViewTest: XCTestCase {
    var sut: GovermentHomeView!
    
    override func setUpWithError() throws {
        sut = GovermentHomeView()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testShoudLoadView() {
        var mockElementDetail = Result(id: "",
                                       dateInsert: "",
                                       slug: "",
                                       columns: "",
                                       fact: "",
                                       organization: "",
                                       resource: "",
                                       url: "",
                                       operations: "",
                                       dataset: "",
                                       createdAt: 0)
        sut.dataInfo = Response(pagination: Pagination(pageSize: 1, page: 1, total: 1), results: [mockElementDetail])
            XCTAssertNotNil(sut.loadView())
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
    
}
