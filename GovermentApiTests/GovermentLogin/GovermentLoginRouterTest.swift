//
//  GovermentLoginRouterTest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentLoginRouterTest: XCTestCase {
    var sut: GovermentLoginRouter!
    
    override func setUpWithError() throws {
        sut = GovermentLoginRouter()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testShouldCallNavigateToNextView() {
        sut.navigation = UINavigationController()
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
        XCTAssertNotNil(sut.navigateToNextView())
    }
}
