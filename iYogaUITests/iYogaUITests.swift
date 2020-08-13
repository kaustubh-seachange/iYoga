//
//  iYogaUITests.swift
//  iYogaUITests
//
//  Created by Kaustubh on 22/06/20.
//  Copyright © 2020 Kaustubh. All rights reserved.
//

import XCTest

class iYogaUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    /*func testGameStyleSwitch() {
      // given
      let slideButton = app.buttons.buttons["Slide"]
      let typeButton = app.segmentedControls.buttons["Type"]
      let slideLabel = app.staticTexts["Get as close as you can to: "]
      let typeLabel = app.staticTexts["Guess where the slider is: "]
      
      // then
      if slideButton.isSelected {
        XCTAssertTrue(slideLabel.exists)
        XCTAssertFalse(typeLabel.exists)
        
        typeButton.tap()
        XCTAssertTrue(typeLabel.exists)
        XCTAssertFalse(slideLabel.exists)
      } else if typeButton.isSelected {
        XCTAssertTrue(typeLabel.exists)
        XCTAssertFalse(slideLabel.exists)
        
        slideButton.tap()
        XCTAssertTrue(slideLabel.exists)
        XCTAssertFalse(typeLabel.exists)
      }
    } */
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
