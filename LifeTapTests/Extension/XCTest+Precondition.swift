//
//  XCTest+Precondition.swift
//  LifeTapTests
//
//  Created by Abdul Rahim on 27/05/21.
//

import XCTest

extension XCTestCase {
    func expectPreconditionFailure(expectedMessage: String, block: () -> ()) {
        let expect = expectation(description: "failing precondition")
        preconditionClosure = {
            (condition, message, file, line) in
            if !condition {
                expect.fulfill()
                XCTAssertEqual(message, expectedMessage, "precondition message didn't match", file: file, line: line)
            }
        }
        block()
        waitForExpectations(timeout: 2.0, handler: nil)
        preconditionClosure = defaultPreconditionClosure
    }
}
