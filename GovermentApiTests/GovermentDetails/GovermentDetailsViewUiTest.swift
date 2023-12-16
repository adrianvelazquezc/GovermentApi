//
//  GovermentDetailsViewUiTest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentDetailsViewUITest: XCTestCase {
    var sut: GovermentDetailsViewUI!
    var mockGestureRecognizer: UITapGestureRecognizer!
    var mockResult: Result?
    
    override func setUpWithError() throws {
        mockResult = Result(id: "",
                            dateInsert: "2016-11-01T19:32:55.363Z",
                            slug: "",
                            columns: "",
                            fact: "",
                            organization: "",
                            resource: "",
                            url: "",
                            operations: "",
                            dataset: "",
                            createdAt: 0)
        if let mockResult =  mockResult {
            sut = GovermentDetailsViewUI(navigation: UINavigationController(), delegate: nil, elementDetail: mockResult)
        }
        mockGestureRecognizer = UITapGestureRecognizer()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testShareButtonTapped() {
        mockResult = Result(id: "",
                            dateInsert: "2016-11-01T19:32:55.363Z",
                            slug: "",
                            columns: "",
                            fact: "",
                            organization: "",
                            resource: "",
                            url: "",
                            operations: "",
                            dataset: "",
                            createdAt: 0)
        if let mockResult =  mockResult {
            sut = GovermentDetailsViewUI(navigation: UINavigationController(), delegate: nil, elementDetail: mockResult)
        }
        XCTAssertNotNil(sut.buttonTapped(UIButton()))
    }
    
    func testArrowTapped() {
        XCTAssertNotNil(sut.arrowTapped(UIButton()))
    }
    
    func testSholdGivesError() {
        let tempResult = Result(id: "",
                                dateInsert: "aaaaaaaaaaaaaaaa",
                                slug: "",
                                columns: "",
                                fact: "",
                                organization: "",
                                resource: "",
                                url: "",
                                operations: "",
                                dataset: "",
                                createdAt: 0)
        let _ = GovermentDetailsViewUI(navigation: UINavigationController(), delegate: nil, elementDetail: tempResult)
    }
}
