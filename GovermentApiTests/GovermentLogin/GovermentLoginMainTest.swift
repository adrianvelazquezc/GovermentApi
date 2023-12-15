//
//  GovermentLoginMainTest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentLoginMainTest: XCTestCase {
    var sut: GovermentLoginMain!
    
    override func setUpWithError() throws {
        sut = GovermentLoginMain()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testBuildingMain() {
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
            XCTAssertNotNil(GovermentLoginMain.createModule(navigation: UINavigationController(), responseData: Response(pagination: Pagination(pageSize: 1, page: 1, total: 1), results: [mockElementDetail])))
    }
}
