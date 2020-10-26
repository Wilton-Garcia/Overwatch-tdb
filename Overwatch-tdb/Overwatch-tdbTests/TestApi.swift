//
//  api_test.swift
//  Overwatch-tdbTests
//
//  Created by Wilton Garcia on 21/10/20.
//
import XCTest
@testable import Overwatch_tdb

class TestApi: XCTestCase {
    
    
    private let apiReference = TeamsAPI()

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApiResponseIsOk() throws {
        
        
        let expectation = self.expectation(description: "Scaling")
        apiReference.ApiIsWorking({ isOk in
          XCTAssertTrue(isOk)
            expectation.fulfill()
        })
     
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
