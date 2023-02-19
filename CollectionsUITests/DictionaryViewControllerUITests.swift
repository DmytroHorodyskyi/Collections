//
//  DictionaryViewControllerUITests.swift
//  MainTabelViewControllerUITests
//
//  Created by Dmytro Horodyskyi on 17.02.2023.
//

import XCTest

final class DictionaryViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
    override func setUp() {
        app.launch()
        app.tables.cells.staticTexts["Dictionary"].tap()
    }
    
    func testTapCellFindTheFirstContactOfArraySuccessfuly() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 0).staticTexts["dictionaryCellLabel"].label.contains("First element search time:"))
    }
    
    func testTapCellFindTheFirstContactOfDictionarySuccessfuly() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 1).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 1).staticTexts["dictionaryCellLabel"].label.contains("First element search time:"))
    }
    
    func testTapCellFindTheLastContactOfArraySuccessfuly() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 2).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 2).staticTexts["dictionaryCellLabel"].label.contains("Last element search time:"))
    }
    
    func testTapCellFindTheLastContactOfDictionarySuccessfuly() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 3).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 3).staticTexts["dictionaryCellLabel"].label.contains("Last element search time:"))
    }
    
    func testTapCellSearchForNonExistingElementOfArraySuccessfuly() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 4).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 4).staticTexts["dictionaryCellLabel"].label.contains("Non-existing element search time:"))
    }
    
    func testTapCellSearchForNonExistingElementDictionarySuccessfuly() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 5).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 5).staticTexts["dictionaryCellLabel"].label.contains("Non-existing element search time:"))
    }
}
