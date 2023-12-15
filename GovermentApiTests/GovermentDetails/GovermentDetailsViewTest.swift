//
//  GovermentDetailsViewTest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentDetailsViewTest: XCTestCase {
    var sut: GovermentDetailsView!
    
    override func setUpWithError() throws {
        sut = GovermentDetailsView()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testShoudLoadView() {
        sut.elementDetail = Result(id: "",
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
            XCTAssertNotNil(sut.loadView())
    }
    
    
    func testShoudViewDidLoadView() {
        XCTAssertNotNil(sut.viewDidLoad())
    }
    
    func testShouldShowError() {
        sut.view = GovermentDetailsViewUI()
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
    
    func testShouldNotifyToWhatsApp() {
        XCTAssertNotNil(sut.notifyShareInfoToWhatsapp(info: "Not empty Info"))
    }
}
