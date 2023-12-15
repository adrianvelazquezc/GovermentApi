//
//  GovermentHomeViewUITest.swift
//  GovermentApiTests
//
//  Created by Mac on 14/12/23.
//

import XCTest
@testable import GovermentApi

final class GovermentHomeViewUITest: XCTestCase {
    var sut: GovermentHomeViewUI!
    
    override func setUpWithError() throws {
        sut = GovermentHomeViewUI()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
}
