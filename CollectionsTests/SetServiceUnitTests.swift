//
//  SetServiceTests.swift
//  CollectionsTests
//
//  Created by Dmytro Horodyskyi on 17.02.2023.
//

import XCTest
@testable import Collections

final class SetServiceUnitTests: XCTestCase {
    
    var setService: SetService!
    
    override func setUp() {
        super.setUp()
        setService = SetService()
    }
    
    override func tearDown() {
        setService = nil
        super.tearDown()
    }
    
    func testIntersectionSuccessfuly() {
        XCTAssertEqual(setService.intersection("abcde", "defghi"), "de")
    }
    
    func testSymmetricDifferenceSuccessfuly() {
        XCTAssertEqual(setService.symmetricDifference("abcde", "defghi"), "abcfghi")
    }
    
    func testSubtractingSuccessfuly() {
        XCTAssertEqual(setService.subtracting("abcde", "defghi"), "abc")
    }
    
}
