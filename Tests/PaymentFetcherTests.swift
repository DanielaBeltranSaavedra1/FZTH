//
//  PaymentFetcherTests.swift
//  Tests
//
//  Created by Daniela Paola Beltran Saavedra on 13/02/23.
//

import XCTest
@testable import BusinessLayer

@MainActor  class PaymentFetcherTests: XCTestCase {
    var sut: PaymentFetcher!
    @MainActor override func setUpWithError() throws {
        sut = PaymentFetcher()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func test_pay() {
        
        sut.pay(payment:  Payment(amount: 3.0, creditCard: CreditCard(number: "1", ownerName: "daniela", cvv: "111", expDate: "11/11"))) {_ in
         
            let cancelExpectation = self.expectation(description: "Cncel")
            cancelExpectation.isInverted = true
            XCTAssertEqual(true, false)
        }
        
    }

}
