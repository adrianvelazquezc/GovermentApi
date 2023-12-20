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
    var mockElementDetail: Result!
    
    override func setUpWithError() throws {
        sut = GovermentHomeView()
        sut.view = UIView()
        mockElementDetail = Result(id: "",
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
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testShouldCallStatusBarAppearanceUpdate() {
        sut.setNeedsStatusBarAppearanceUpdate()
    }
    
    func testShoudLoadView() {
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
        sut.showLoading()
        Goverment_ActivityIndicator.show(parent: sut.view)
        XCTAssertTrue(Goverment_ActivityIndicator.isLoading())
    }
    
    func testShouldRemoveLoading() {
        sut.dissmissLoading()
        Goverment_ActivityIndicator.remove(parent: sut.view)
        XCTAssertFalse(Goverment_ActivityIndicator.isLoading(), "Loading indicator should not be animating after dismissal")
    }
    
    func testShoudNotifyGetFilterStringIdCase() {
        sut.view = UIView()
        sut.ui = GovermentHomeViewUI(
            navigation: UINavigationController(),
            delegate: nil,
            responseData: [mockElementDetail])
        sut.ui?.currentSearch = .id
        XCTAssertNotNil(sut.notifyGetFilterString(filter: "id"))
    }
    
    func testShoudNotifyGetFilterStringOrganizationCase() {
        sut.view = UIView()
        sut.ui = GovermentHomeViewUI(
            navigation: UINavigationController(),
            delegate: nil,
            responseData: [mockElementDetail])
        sut.ui?.currentSearch = .organization
        XCTAssertNotNil(sut.notifyGetFilterString(filter: "organization"))
    }
    
    func testShoudNotifyGetFilterStringUrlLabelCase() {
        sut.view = UIView()
        sut.ui = GovermentHomeViewUI(
            navigation: UINavigationController(),
            delegate: nil,
            responseData: [mockElementDetail])
        sut.ui?.currentSearch = .urlLabel
        XCTAssertNotNil(sut.notifyGetFilterString(filter: "urlLabel"))
    }
    
    func testShoudNotifyGetEmptyFilterString() {
        XCTAssertNotNil(sut.notifyGetFilterString(filter: ""))
    }
    
    func testShoudNotifyShowInfo() {
        XCTAssertNotNil(sut.notifyShowInfo(element: Result(id: "",
                                                           dateInsert: "",
                                                           slug: "",
                                                           columns: "",
                                                           fact: "",
                                                           organization: "",
                                                           resource: "",
                                                           url: "",
                                                           operations: "",
                                                           dataset: "",
                                                           createdAt: 0)))
    }
    
    func testShoulCallAddNewValues() {
        let mockElementDetail = Result(id: "",
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
        XCTAssertNotNil(sut.addNewValues())
    }
}
