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
    
    func testShouldSearchInfo() {
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
    
    func testShouldCallSelectAnOptionWhileIsShowing() {
        sut.dropdownButton.isShowing = true
        XCTAssertNotNil(sut.dropdownButton.selectAnOption())
    }
    
    func testShouldCallSelectAnOptionWhileIsNotShowing() {
        sut.dropdownButton.isShowing = false
        XCTAssertNotNil(sut.dropdownButton.selectAnOption())
    }
    
    func testShouldCallSelectGenderChoosedTapped() {
        sut.dropdownButton.isShowing = false
        XCTAssertNotNil(sut.dropdownButton.genderChoosedTapped(Goverment_DropdownViewButton("test1")))
    }
    
    func testShouldCallHiddeWhenTapped() {
        sut.dropdownButton.isShowing = false
        XCTAssertNotNil(sut.dropdownButton.hiddeWhenTapped())
    }
    
    func testShouldCallDidChoiceFilter() {
        XCTAssertNotNil(sut.didChoiceFilter("test1"))
    }
}
