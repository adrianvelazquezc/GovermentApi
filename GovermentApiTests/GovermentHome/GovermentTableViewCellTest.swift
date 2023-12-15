//
//  GovermentTableViewCellTest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentTableViewCellTest: XCTestCase {
    var sut: GovermentTableViewCell!
    
    override func setUpWithError() throws {
        sut = GovermentTableViewCell()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func testCreateTableViewCell() {
        XCTAssertNotNil(sut.idLabelTitle, "idLabelTitle is not Nil")
        }
}
