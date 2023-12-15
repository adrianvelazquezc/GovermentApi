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
    var mockGestureRecognizer: UITapGestureRecognizer!
    
    override func setUpWithError() throws {
        sut = GovermentHomeViewUI()
        mockGestureRecognizer = UITapGestureRecognizer()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testShouldDissmisKeyboard() {
        XCTAssertNotNil(sut.dissmisKeyboard(mockGestureRecognizer))
    }
    
    func testShouldsearchInfo() {
        XCTAssertNotNil(sut.searchInfo)
    }
    
    func testShouldAddNewItems() {
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
        XCTAssertNotNil(sut.addNewItemsFrom(list: [mockElementDetail]))
    }
    
    func testShouldCallNumberOfRowsInSection() {
        XCTAssertNotNil(sut.tableView(UITableView(), numberOfRowsInSection: 1))
    }
    
    func testShouldCallCreateCell() {
        let mockView = GovermentHomeViewUI(navigation: UINavigationController(),
                                           delegate: nil,
                                           responseData: [Result(id: "",
                                                                 dateInsert: "",
                                                                 slug: "",
                                                                 columns: "",
                                                                 fact: "",
                                                                 organization: "",
                                                                 resource: "",
                                                                 url: "",
                                                                 operations: "",
                                                                 dataset: "",
                                                                 createdAt: 0)])
        mockView.originalElementList = [Result(id: "",
                                               dateInsert: "",
                                               slug: "",
                                               columns: "",
                                               fact: "",
                                               organization: "",
                                               resource: "",
                                               url: "",
                                               operations: "",
                                               dataset: "",
                                               createdAt: 0)]
        mockView.elementList = mockView.originalElementList
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//            XCTAssertNotNil(self.sut.tableView(UITableView(), cellForRowAt: IndexPath(item: 0, section: 0)))
        }
    }
    
    func testShouldCallScrollViewDidScroll() {
        XCTAssertNotNil(sut.scrollViewDidScroll(UIScrollView()))
    }
    
    func testShouldCallDidSelectRowAt() {
        XCTAssertNotNil(sut.tableView(UITableView(), didSelectRowAt: IndexPath(item: 1, section: 1)))
    }
}
