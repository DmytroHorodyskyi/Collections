//
//  DictionaryViewControllerUITests.swift
//  MainTabelViewControllerUITests
//
//  Created by Dmytro Horodyskyi on 17.02.2023.
//

import XCTest

final class DictionaryViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    func waitForLoading(cell number: Int) {
        let predicate = NSPredicate { _, _ in
            self.app.collectionViews.children(matching: .cell).element(boundBy: number).staticTexts["dictionaryCellLabel"].label != ""
           }
           wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 30)
    }
    
    override func setUp() {
        app.launch()
        app.tables.cells.staticTexts["Dictionary"].tap()
    }
    
    func testTapCellFindTheFirstContactOfArraySuccessfuly() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).tap()
        waitForLoading(cell: 0)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 0).staticTexts["dictionaryCellLabel"].label.contains("First element search time:"))
    }
    
    func testTapCellFindTheFirstContactOfDictionarySuccessfuly() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 1).tap()
        waitForLoading(cell: 1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 1).staticTexts["dictionaryCellLabel"].label.contains("First element search time:"))
    }
    
    func testTapCellFindTheLastContactOfArraySuccessfuly() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 2).tap()
        waitForLoading(cell: 2)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 2).staticTexts["dictionaryCellLabel"].label.contains("Last element search time:"))
    }
    
    func testTapCellFindTheLastContactOfDictionarySuccessfuly() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 3).tap()
        waitForLoading(cell: 3)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 3).staticTexts["dictionaryCellLabel"].label.contains("Last element search time:"))
    }
    
    func testTapCellSearchForNonExistingElementOfArraySuccessfuly() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 4).tap()
        waitForLoading(cell: 4)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 4).staticTexts["dictionaryCellLabel"].label.contains("Non-existing element search time:"))
    }
    
    func testTapCellSearchForNonExistingElementDictionarySuccessfuly() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 5).tap()
        waitForLoading(cell: 5)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 5).staticTexts["dictionaryCellLabel"].label.contains("Non-existing element search time:"))
    }
}
