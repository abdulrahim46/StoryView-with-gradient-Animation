//
//  LifeTapUITests.swift
//  LifeTapUITests
//
//  Created by Abdul Rahim on 26/05/21.
//

import XCTest

class LifeTapUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
//    func testButtonTap() {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launchArguments = ["enable-testing"]
//        app.launch()
//        
//        #if DEBUG
//        if CommandLine.arguments.contains("enable-testing") {
//           // configureTestingState()
//        }
//        #endif
//        
//        //app.buttons["profile-1"].tap()
//    }
    

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
