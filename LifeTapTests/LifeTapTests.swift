//
//  LifeTapTests.swift
//  LifeTapTests
//
//  Created by Abdul Rahim on 26/05/21.
//

import XCTest
@testable import LifeTap

class LifeTapTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    var viewController: ViewController!
    
    
    override func setUp() {
         super.setUp()
         //1
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//                let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
//        viewController = (navigationController.topViewController as! ViewController)
        
        //2
       // UIApplication.shared.keyWindow!.rootViewController = viewController

         //3
//        XCTAssertNotNil(navigationController.view)
//        XCTAssertNotNil(viewController.view)
     }
    
    
    
//    func testExpectPreconditionFailure() {
//        let frame = CGRect(x: 0, y: 0, width: 100, height: 80)
//        expectPreconditionFailure(expectedMessage: "The size of width and height are required to be equal") {
//            //storyButton.validate(width: frame.width, height: frame.height)
//        }
//    }
    
    
//    func testCollectionViewCellsIsDisplayedWithMatchingImage() {
//        //1 Arrange
//        let fakeImagesName = ["FakeA", "FakeB", "FakeC"]
//        viewController.models = fakeImagesName
//
//        //2 Act
//        viewController.collectionView.reloadData()
//        RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.5))
//
//        //3 Assert
//        let cells = viewController.collectionView as! [ImageCollectionViewCell]
//        XCTAssertEqual(cells.count, fakeImagesName.count, "Cells count should match array.count")
//        for I in 0...cells.count - 1 {
//            let cell = cells[I]
//            XCTAssertEqual(cell.photoImageView.image, UIImage(named: fakeImagesName[I]), "Image should be matching")
//        }}

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
