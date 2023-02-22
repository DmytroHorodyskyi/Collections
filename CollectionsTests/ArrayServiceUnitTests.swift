//
//  ArrayServiceTests.swift
//  CollectionsTests
//
//  Created by Dmytro Horodyskyi on 17.02.2023.
//

import XCTest
@testable import Collections

final class ArrayServiceUnitTests: XCTestCase {
    
    var arrayService: ArrayService!
    
    override func setUp() {
        super.setUp()
        arrayService = ArrayService()
        arrayService.generateArray()
    }
    
    override func tearDown() {
        arrayService = nil
        super.tearDown()
    }
    
    func testGenerateArraySuccessfuly() {
        let expected = 10_000_000
        XCTAssertEqual( arrayService.array.count, expected )
    }
    
    func testInsertAtTheBeginigOneByOneSuccessfuly() {
        arrayService.array = [0]
        arrayService.insertAtTheBeginigOneByOne()
        XCTAssertEqual( arrayService.array.count, 1001)
        XCTAssertEqual( arrayService.array.last, 0)
    }
    
    func testInsertAtTheBeginigAtOnceSuccessfuly() {
        arrayService.array = [0]
        arrayService.insertAtTheBeginigAtOnce()
        XCTAssertEqual( arrayService.array.count, 1001)
        XCTAssertEqual( arrayService.array.last, 0)
    }
    
    func testInsertInTheMiddleOneByOneSuccessfuly() {
        arrayService.array = [0, 1]
        arrayService.insertInTheMiddleOneByOne()
        XCTAssertEqual( arrayService.array.count, 1002)
        XCTAssertEqual( arrayService.array.first, 0)
        XCTAssertEqual( arrayService.array.last, 1)
    }
    
    func testInsertInTheMiddleAtOnceSuccessfuly() {
        arrayService.array = [0, 1]
        arrayService.insertInTheMiddleAtOnce()
        XCTAssertEqual( arrayService.array.count, 1002)
        XCTAssertEqual( arrayService.array.first, 0)
        XCTAssertEqual( arrayService.array.last, 1)
    }
    
    func testAppendToTheEndOneByOneSuccessfuly() {
        arrayService.array = [0]
        arrayService.appendToTheEndOneByOne()
        XCTAssertEqual( arrayService.array.count, 1001)
        XCTAssertEqual( arrayService.array.last, 999)
    }
    
    func testAppendToTheEndAtOnceSuccessfuly() {
        arrayService.array = [0]
        arrayService.appendToTheEndAtOnce()
        XCTAssertEqual( arrayService.array.count, 1001)
        XCTAssertEqual( arrayService.array.last, 999)
    }
    
    func testRemoveAtTheBeginingOneByOneSuccessfuly() {
        arrayService.array = Array(0...1000)
        arrayService.removeAtTheBeginingOneByOne()
        XCTAssertEqual( arrayService.array.count, 1)
        XCTAssertEqual( arrayService.array, [1000])
    }
    
    func testRemoveAtTheBeginigAtOnceSuccessfuly() {
        arrayService.array = Array(0...1000)
        arrayService.removeAtTheBeginigAtOnce()
        XCTAssertEqual( arrayService.array.count, 1)
        XCTAssertEqual( arrayService.array, [1000])
    }
    
    func testRemoveInTheMiddleOneByOneSuccessfuly() {
        arrayService.array = Array(0...1001)
        arrayService.removeInTheMiddleOneByOne()
        XCTAssertEqual( arrayService.array.count, 2)
        XCTAssertEqual( arrayService.array.first, 0)
        XCTAssertEqual( arrayService.array.last, 1001)
    }
    
    func testRemoveInTheMiddleAtOnceSuccessfuly() {
        arrayService.array = Array(0...1001)
        arrayService.removeInTheMiddleAtOnce()
        XCTAssertEqual( arrayService.array.count, 2)
        XCTAssertEqual( arrayService.array.first, 0)
        XCTAssertEqual( arrayService.array.last, 1001)
    }
    
    func testRemoveAtTheEndOneByOneSuccessfuly() {
        arrayService.array = Array(0...1000)
        arrayService.removeAtTheEndOneByOne()
        XCTAssertEqual( arrayService.array.count, 1)
        XCTAssertEqual( arrayService.array, [0])
    }
    
    func testRemoveAtTheEndAtOnceSuccessfuly() {
        arrayService.array = Array(0...1000)
        arrayService.removeAtTheEndAtOnce()
        XCTAssertEqual( arrayService.array.count, 1)
        XCTAssertEqual( arrayService.array, [0])
    }
}
