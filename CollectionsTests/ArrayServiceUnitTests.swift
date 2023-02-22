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
    }
    
    override func tearDown() {
        arrayService = nil
        super.tearDown()
    }
    
    func testGenerateArraySuccessfuly() {
        arrayService.generateArray()
        let expected = 10_000_000
        XCTAssertEqual( arrayService.array.count, expected )
    }
    
    func testInsertAtTheBeginigOneByOneSuccessfuly() {
        arrayService.generateArray()
        arrayService.array = [0]
        arrayService.insertAtTheBeginigOneByOne()
        XCTAssertEqual( arrayService.array.count, 1001)
        XCTAssertEqual( arrayService.array.last, 0)
    }
    
    func testInsertAtTheBeginigAtOnceSuccessfuly() {
        arrayService.generateArray()
        arrayService.array = [0]
        arrayService.insertAtTheBeginigAtOnce()
        XCTAssertEqual( arrayService.array.count, 1001)
        XCTAssertEqual( arrayService.array.last, 0)
    }
    
    func testInsertInTheMiddleOneByOneSuccessfuly() {
        arrayService.generateArray()
        arrayService.array = [0, 1]
        arrayService.insertInTheMiddleOneByOne()
        XCTAssertEqual( arrayService.array.count, 1002)
        XCTAssertEqual( arrayService.array.first, 0)
        XCTAssertEqual( arrayService.array.last, 1)
    }
    
    func testInsertInTheMiddleAtOnceSuccessfuly() {
        arrayService.generateArray()
        arrayService.array = [0, 1]
        arrayService.insertInTheMiddleAtOnce()
        XCTAssertEqual( arrayService.array.count, 1002)
        XCTAssertEqual( arrayService.array.first, 0)
        XCTAssertEqual( arrayService.array.last, 1)
    }
    
    func testAppendToTheEndOneByOneSuccessfuly() {
        arrayService.generateArray()
        arrayService.array = [0]
        arrayService.appendToTheEndOneByOne()
        XCTAssertEqual( arrayService.array.count, 1001)
        XCTAssertEqual( arrayService.array.last, 999)
    }
    
    func testAppendToTheEndAtOnceSuccessfuly() {
        arrayService.generateArray()
        arrayService.array = [0]
        arrayService.appendToTheEndAtOnce()
        XCTAssertEqual( arrayService.array.count, 1001)
        XCTAssertEqual( arrayService.array.last, 999)
    }
    
    func testRemoveAtTheBeginingOneByOneSuccessfuly() {
        arrayService.generateArray()
        arrayService.array = Array(0...1000)
        arrayService.removeAtTheBeginingOneByOne()
        XCTAssertEqual( arrayService.array.count, 1)
        XCTAssertEqual( arrayService.array, [1000])
    }
    
    func testRemoveAtTheBeginigAtOnceSuccessfuly() {
        arrayService.generateArray()
        arrayService.array = Array(0...1000)
        arrayService.removeAtTheBeginigAtOnce()
        XCTAssertEqual( arrayService.array.count, 1)
        XCTAssertEqual( arrayService.array, [1000])
    }
    
    func testRemoveInTheMiddleOneByOneSuccessfuly() {
        arrayService.generateArray()
        arrayService.array = Array(0...1001)
        arrayService.removeInTheMiddleOneByOne()
        XCTAssertEqual( arrayService.array.count, 2)
        XCTAssertEqual( arrayService.array.first, 0)
        XCTAssertEqual( arrayService.array.last, 1001)
    }
    
    func testRemoveInTheMiddleAtOnceSuccessfuly() {
        arrayService.generateArray()
        arrayService.array = Array(0...1001)
        arrayService.removeInTheMiddleAtOnce()
        XCTAssertEqual( arrayService.array.count, 2)
        XCTAssertEqual( arrayService.array.first, 0)
        XCTAssertEqual( arrayService.array.last, 1001)
    }
    
    func testRemoveAtTheEndOneByOneSuccessfuly() {
        arrayService.generateArray()
        arrayService.array = Array(0...1000)
        arrayService.removeAtTheEndOneByOne()
        XCTAssertEqual( arrayService.array.count, 1)
        XCTAssertEqual( arrayService.array, [0])
    }
    
    func testRemoveAtTheEndAtOnceSuccessfuly() {
        arrayService.generateArray()
        arrayService.array = Array(0...1000)
        arrayService.removeAtTheEndAtOnce()
        XCTAssertEqual( arrayService.array.count, 1)
        XCTAssertEqual( arrayService.array, [0])
    }
}
