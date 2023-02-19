//
//  SetViewControllerUITests.swift
//  MainTabelViewControllerUITests
//
//  Created by Dmytro Horodyskyi on 17.02.2023.
//

import XCTest

final class SetViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
        app.tables.cells.staticTexts["Set"].tap()
        app.textFields["mainTextField"].tap()
        app.textFields["mainTextField"].typeText("abcd")
        app.textFields["auxiliaryTextField"].tap()
        app.textFields["auxiliaryTextField"].typeText("cdefg")
    }
    
    func testAllMatchingLettersSuccessfuly() {
        
        app.buttons["allMatchingLetters"].tap()
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "firstLabel").label, "cd")
    }
    
    func testAllCharactersThatDoNotMatchSuccessfuly() {

        app.buttons["allCharactersThatDoNotMatch"].tap()
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "secondLabel").label, "abefg")
    }
    
    func testAllUniqueCharactersFromTheFirst() {

        app.buttons["allUniqueCharactersFromTheFirst"].tap()
        app.buttons["Return"].tap()
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "thirdLabel").label, "ab")
    }
}
