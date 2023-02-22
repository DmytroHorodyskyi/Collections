//
//  MainTabelViewControllerUITests.swift
//  MainTabelViewControllerUITests
//
//  Created by Dmytro Horodyskyi on 16.02.2023.
//

import XCTest

final class MainTabelViewControllerUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }
    
    func testOpenArrayViewControllerSuccessfuly() {
           
        app.tables.cells.staticTexts["Array"].tap()
        XCTAssert(app.navigationBars["Array"].exists)
    }
    
    func testOpenSetViewControllerSuccessfuly() {
           
        app.tables.cells.staticTexts["Set"].tap()
        XCTAssert(app.navigationBars["Set"].exists)
    }
    
    func testOpenDictionaryViewControllerSuccessfuly() {
           
        app.tables.cells.staticTexts["Dictionary"].tap()
        XCTAssert(app.navigationBars["Dictionary"].exists)
    }
}
