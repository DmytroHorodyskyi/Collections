//
//  ArrayViewControllerUITests.swift
//  CollectionsTests
//
//  Created by Dmytro Horodyskyi on 17.02.2023.
//

import XCTest

final class ArrayViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    func waitForLoading(cell number: Int) {
        let predicate = NSPredicate { _, _ in
            self.app.collectionViews.children(matching: .cell).element(boundBy: number).staticTexts["arrayCellLabel"].label != ""
           }
           wait(for: [expectation(for: predicate, evaluatedWith: nil)], timeout: 30)
    }

    override func setUp() {
        app.launch()
        app.tables.cells.staticTexts["Array"].tap()
        app.collectionViews.cells.staticTexts["Create Int array with 10_000_000 elements"].tap()
        waitForLoading(cell: 0)
    }
    
    func testTapCellCreateIntArraySuccessfuly() async {
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 0).staticTexts["arrayCellLabel"].label.contains("Array creation time:"))
    }
    
    func testTapCellInsertAtTheBeginningOneByOneSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 1).tap()
        waitForLoading(cell: 1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 1).staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellInsertAtTheBeginningAtOnceSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 2).tap()
        waitForLoading(cell: 2)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 2).staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellInsertInTheMiddleOneByOneSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 3).tap()
        waitForLoading(cell: 3)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 3).staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellInsertInTheMiddleAtOnceSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 4).tap()
        waitForLoading(cell: 4)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 4).staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellAppendToTheEndOneByOneSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 5).tap()
        waitForLoading(cell: 5)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 5).staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellAppendToTheEndAtOnceSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 6).tap()
        waitForLoading(cell: 6)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 6).staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellRemoveAtTheBeginningOneByOneSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 7).tap()
        waitForLoading(cell: 7)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 7).staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
    
    func testTapCellRemoveAtTheBeginningAtOnceSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 8).tap()
        waitForLoading(cell: 8)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 8).staticTexts["arrayCellLabel"].label.contains("Removing time:"))

    }
    
    func testTapCellRemoveInTheMiddleOneByOneSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 9).tap()
        waitForLoading(cell: 9)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 9).staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
    
    func testTapCellRemoveInTheMiddleAtOnceSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 10).tap()
        waitForLoading(cell: 10)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 10).staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
    
    func testTapCellRemoveAtTheEndOneByOneSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 11).tap()
        waitForLoading(cell: 11)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 11).staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
    
    func testTapCellRemoveAtTheEndAtOnceSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 12).tap()
        waitForLoading(cell: 12)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 12).staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
}
