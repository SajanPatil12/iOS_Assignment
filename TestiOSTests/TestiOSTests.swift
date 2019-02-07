//
//  TestiOSTests.swift
//  TestiOSTests
//
//  Created by Harish Sherigar on 2/3/19.
//  Copyright © 2019 Sajan. All rights reserved.
//
import UIKit
import XCTest

@testable import TestiOS

class TestiOSTests: XCTestCase {
    var viewController: ViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = ViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewController = nil
        super.tearDown()
    }

    func test_CanInstantiate_ViewController() {
        
        XCTAssertNotNil(viewController)
    }

    func test_ControllerHas_TableView() {

        viewController.loadViewIfNeeded()
        XCTAssertNotNil(viewController.countryTableview,
                        "Controller should have a tableview")
    }

    func test_ConformsToTableviewViewDataSource() {
        XCTAssertTrue(viewController.responds(to:(#selector(viewController.tableView(_:numberOfRowsInSection:)))))
        XCTAssertTrue(viewController.responds(to:(#selector(viewController.tableView(_:cellForRowAt:)))))
    }

    func test_TableViewCellHasReuseIdentifier() {
        viewController.loadViewIfNeeded()
        let cell = viewController.tableView(viewController.countryTableview, cellForRowAt: IndexPath(row: 0, section: 0)) as? CountryTableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "CountryTableViewCellIdentifier"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }

    func test_get_data_withURL() {
        
        let apiHandler = ApiHandler()
        
        apiHandler.getData(url: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") { (JSON, status) in
            
            XCTAssertEqual(status,true,"success")

        }
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
