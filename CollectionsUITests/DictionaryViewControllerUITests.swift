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
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 0)
        cell.tap()
        let predicate = NSPredicate { _, _ in
            cell.staticTexts["dictionaryCellLabel"].label != ""}
        wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 10)
        XCTAssert(cell.staticTexts["dictionaryCellLabel"].label.contains("First element search time:"))
    }
    
    func testTapCellFindTheFirstContactOfDictionarySuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 1)
        cell.tap()
        let predicate = NSPredicate { _, _ in
            cell.staticTexts["dictionaryCellLabel"].label != ""}
        wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 10)
        XCTAssert(cell.staticTexts["dictionaryCellLabel"].label.contains("First element search time:"))
    }
    
    func testTapCellFindTheLastContactOfArraySuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 2)
            cell.tap()
        let predicate = NSPredicate { _, _ in
            cell.staticTexts["dictionaryCellLabel"].label != ""}
        wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 10)
        XCTAssert(cell.staticTexts["dictionaryCellLabel"].label.contains("Last element search time:"))
    }
    
    func testTapCellFindTheLastContactOfDictionarySuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 3)
            cell.tap()
        let predicate = NSPredicate { _, _ in
            cell.staticTexts["dictionaryCellLabel"].label != ""}
        wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 10)
        XCTAssert(cell.staticTexts["dictionaryCellLabel"].label.contains("Last element search time:"))
    }
    
    func testTapCellSearchForNonExistingElementOfArraySuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 4)
            cell.tap()
        let predicate = NSPredicate { _, _ in
            cell.staticTexts["dictionaryCellLabel"].label != ""}
        wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 10)
        XCTAssert(cell.staticTexts["dictionaryCellLabel"].label.contains("Non-existing element search time:"))
    }
    
    func testTapCellSearchForNonExistingElementDictionarySuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 5)
            cell.tap()
        let predicate = NSPredicate { _, _ in
            cell.staticTexts["dictionaryCellLabel"].label != ""}
        wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 10)
        XCTAssert(cell.staticTexts["dictionaryCellLabel"].label.contains("Non-existing element search time:"))
    }
}
