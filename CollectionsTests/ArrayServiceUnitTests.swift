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
        arrayService.generateArray(of: 10)
        arrayService.generateAuxiliaryArray(of: 3)
    }
    
    override func tearDown() {
        arrayService = nil
        super.tearDown()
    }
    
    func testGenerateArraySuccessfuly() {
        XCTAssertEqual( arrayService.array, [0,1,2,3,4,5,6,7,8,9] )
    }
    
    func testInsertAtTheBeginigOneByOneSuccessfuly() {
        arrayService.insertAtTheBeginigOneByOne()
        XCTAssertEqual( arrayService.array, [0,1,2,0,1,2,3,4,5,6,7,8,9] )
    }
    
    func testInsertAtTheBeginigAtOnceSuccessfuly(){
        arrayService.insertAtTheBeginigAtOnce()
        XCTAssertEqual( arrayService.array, [0,1,2,0,1,2,3,4,5,6,7,8,9] )
    }
    
    func testInsertInTheMiddleOneByOneSuccessfuly(){
        arrayService.insertInTheMiddleOneByOne()
        XCTAssertEqual( arrayService.array, [0,1,2,3,4,0,1,2,5,6,7,8,9] )
    }
    
    func testInsertInTheMiddleAtOnceSuccessfuly(){
        arrayService.insertInTheMiddleAtOnce()
        XCTAssertEqual( arrayService.array, [0,1,2,3,4,0,1,2,5,6,7,8,9] )
    }
    
    func testAppendToTheEndOneByOneSuccessfuly(){
        arrayService.appendToTheEndOneByOne()
        XCTAssertEqual( arrayService.array, [0,1,2,3,4,5,6,7,8,9,0,1,2] )
    }
    
    func testAppendToTheEndAtOnceSuccessfuly(){
        arrayService.appendToTheEndAtOnce()
        XCTAssertEqual( arrayService.array, [0,1,2,3,4,5,6,7,8,9,0,1,2] )
    }
    
    func testRemoveAtTheBeginingOneByOneSuccessfuly(){
        arrayService.removeAtTheBeginingOneByOne()
        XCTAssertEqual( arrayService.array, [3,4,5,6,7,8,9] )
    }
    
    func testRemoveAtTheBeginigAtOnceSuccessfuly(){
        arrayService.removeAtTheBeginigAtOnce()
        XCTAssertEqual( arrayService.array, [3,4,5,6,7,8,9] )
    }
    
    func testRemoveInTheMiddleOneByOneSuccessfuly(){
        arrayService.removeInTheMiddleOneByOne()
        XCTAssertEqual( arrayService.array, [0,1,2,3,7,8,9] )
    }
    
    func testRemoveInTheMiddleAtOnceSuccessfuly(){
        arrayService.removeInTheMiddleAtOnce()
        XCTAssertEqual( arrayService.array, [0,1,2,3,7,8,9] )
    }
    
    func testRemoveAtTheEndOneByOneSuccessfuly(){
        arrayService.removeAtTheEndOneByOne()
        XCTAssertEqual( arrayService.array, [0,1,2,3,4,5,6] )
    }
    
    func testRemoveAtTheEndAtOnceSuccessfuly(){
        arrayService.removeAtTheEndAtOnce()
        XCTAssertEqual( arrayService.array, [0,1,2,3,4,5,6] )
    }    
}
