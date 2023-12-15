//
//  GovermentDetailsMainTest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentDetailsMainTest: XCTestCase {
    var sut: GovermentDetailsMain!
       
       override func setUpWithError() throws {
           sut = GovermentDetailsMain()
       }
       
       override func tearDownWithError() throws {
           sut = nil
       }

    
    func testShouldCall() {
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
        XCTAssertNotNil(GovermentDetailsMain.createModule(navigation: UINavigationController(), elementDetail: mockElementDetail))
    }

}
