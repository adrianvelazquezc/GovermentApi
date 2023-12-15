//
//  GovermentHomePresenterTest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentHomePresenterTest: XCTestCase {
    var sut: GovermentHomePresenter!
    
    override func setUpWithError() throws {
        sut = GovermentHomePresenter()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func testShouldCallRequestElementDetails() {
        XCTAssertNotNil(sut.requestElementDetails(element: Result(id: "",
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
}
