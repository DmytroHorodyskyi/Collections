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
        
    }
    
    func testTapCellCreateIntArraySuccessfuly() {
        XCTAssert( app.collectionViews.children(matching: .cell).element(boundBy: 1 ).waitForExistence(timeout: 10))
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 0).staticTexts["arrayCellLabel"].label.contains("Array creation time:"))
    }
    
    func testTapCellInsertAtTheBeginningOneByOneSuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 1)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        var timeout = 0
        while cell.staticTexts["arrayCellLabel"].label == "" && timeout <= 10 {
            sleep(1); timeout += 1 }
        XCTAssert(cell.staticTexts["arrayCellLabel"].waitForExistence(timeout: 10))
        XCTAssert(cell.staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellInsertAtTheBeginningAtOnceSuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 2)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        var timeout = 0
        while cell.staticTexts["arrayCellLabel"].label == "" && timeout <= 10 {
            sleep(1); timeout += 1 }
        XCTAssert(cell.staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellInsertInTheMiddleOneByOneSuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 3)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        var timeout = 0
        while cell.staticTexts["arrayCellLabel"].label == "" && timeout <= 10 {
            sleep(1); timeout += 1 }
        XCTAssert(cell.staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellInsertInTheMiddleAtOnceSuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 4)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        var timeout = 0
        while cell.staticTexts["arrayCellLabel"].label == "" && timeout <= 10 {
            sleep(1); timeout += 1 }
        XCTAssert(cell.staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellAppendToTheEndOneByOneSuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 5)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        var timeout = 0
        while cell.staticTexts["arrayCellLabel"].label == "" && timeout <= 10 {
            sleep(1); timeout += 1 }
        XCTAssert(cell.staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellAppendToTheEndAtOnceSuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 6)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        var timeout = 0
        while cell.staticTexts["arrayCellLabel"].label == "" && timeout <= 10 {
            sleep(1); timeout += 1 }
        XCTAssert(cell.staticTexts["arrayCellLabel"].label.contains("Insertion time:"))
    }
    
    func testTapCellRemoveAtTheBeginningOneByOneSuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 7)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        var timeout = 0
        while cell.staticTexts["arrayCellLabel"].label == "" && timeout <= 10 {
            sleep(1); timeout += 1 }
        XCTAssert(cell.staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
    
    func testTapCellRemoveAtTheBeginningAtOnceSuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 8)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        var timeout = 0
        while cell.staticTexts["arrayCellLabel"].label == "" && timeout <= 10 {
            sleep(1); timeout += 1 }
        XCTAssert(cell.staticTexts["arrayCellLabel"].label.contains("Removing time:"))
        
    }
    
    func testTapCellRemoveInTheMiddleOneByOneSuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 9)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        var timeout = 0
        while cell.staticTexts["arrayCellLabel"].label == "" && timeout <= 10 {
            sleep(1); timeout += 1 }
        XCTAssert(cell.staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
    
    func testTapCellRemoveInTheMiddleAtOnceSuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 10)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        var timeout = 0
        while cell.staticTexts["arrayCellLabel"].label == "" && timeout <= 10 {
            sleep(1); timeout += 1 }
        XCTAssert(cell.staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
    
    func testTapCellRemoveAtTheEndOneByOneSuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 11)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        var timeout = 0
        while cell.staticTexts["arrayCellLabel"].label == "" && timeout <= 10 {
            sleep(1); timeout += 1 }
        XCTAssert(cell.staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
    
    func testTapCellRemoveAtTheEndAtOnceSuccessfuly() {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 12)
        XCTAssert(cell.waitForExistence(timeout: 10))
        cell.tap()
        var timeout = 0
        while cell.staticTexts["arrayCellLabel"].label == "" && timeout <= 10 {
            sleep(1); timeout += 1 }
        XCTAssert(cell.staticTexts["arrayCellLabel"].label.contains("Removing time:"))
    }
}
