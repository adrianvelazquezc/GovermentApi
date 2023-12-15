//
//  GovermentHomeRouterTest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentHomeRouterTest: XCTestCase {
    var sut: GovermentHomeRouter!
       
       override func setUpWithError() throws {
           sut = GovermentHomeRouter()
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
        XCTAssertNotNil(sut.navigateToElementDetails(element: mockElementDetail))
    }
}
