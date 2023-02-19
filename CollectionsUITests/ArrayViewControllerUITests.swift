//
//  ArrayViewControllerUITests.swift
//  CollectionsTests
//
//  Created by Dmytro Horodyskyi on 17.02.2023.
//

import XCTest

final class ArrayViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
        app.tables.cells.staticTexts["Array"].tap()
        app.collectionViews.cells.staticTexts["Create Int array with 10_000_000 elements"].tap()
        sleep(5)
    }
    
    func testTapCellCreateIntArraySuccessfuly() {
        
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 0).staticTexts["arrayCellLabel"].label.contains("Array creation time:"))
    }
    
    func testTapCellInsertAtTheBeginningOneByOneSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 1).tap()
        sleep(5)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 1).staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellInsertAtTheBeginningAtOnceSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 2).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 2).staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellInsertInTheMiddleOneByOneSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 3).tap()
        sleep(5)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 3).staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellInsertInTheMiddleAtOnceSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 4).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 4).staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellAppendToTheEndOneByOneSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 5).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 5).staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellAppendToTheEndAtOnceSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 6).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 6).staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellRemoveAtTheBeginningOneByOneSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 7).tap()
        sleep(5)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 7).staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
    
    func testTapCellRemoveAtTheBeginningAtOnceSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 8).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 8).staticTexts["arrayCellLabel"].label.contains("Removing time:"))

    }
    
    func testTapCellRemoveInTheMiddleOneByOneSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 9).tap()
        sleep(5)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 9).staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
    
    func testTapCellRemoveInTheMiddleAtOnceSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 10).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 10).staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
    
    func testTapCellRemoveAtTheEndOneByOneSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 11).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 11).staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
    
    func testTapCellRemoveAtTheEndAtOnceSuccessfuly() {
        app.collectionViews.children(matching: .cell).element(boundBy: 12).tap()
        sleep(1)
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 12).staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
}
