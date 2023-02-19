//
//  ArrayServiceTests.swift
//  CollectionsTests
//
//  Created by Dmytro Horodyskyi on 17.02.2023.
//

import XCTest
@testable import Collections

final class ArrayServiceTests: XCTestCase {
    
    var arrayService: ArrayService!
    
    override func setUp() {
        super.setUp()
        arrayService = ArrayService()
        arrayService.exposeGenerateArray(size: 10)
        arrayService.exposeGenerateAuxiliaryArray(size: 3)
    }
    
    override func tearDown() {
        arrayService = nil
        super.tearDown()
    }
    
    func testGenerateArraySuccessfuly() {
        XCTAssertEqual( arrayService.getArray(), [0,1,2,3,4,5,6,7,8,9] )
    }
    
    func testInsertAtTheBeginigOneByOneSuccessfuly() {
        arrayService.exposeInsertAtTheBeginigOneByOne()
        XCTAssertEqual( arrayService.getArray(), [0,1,2,0,1,2,3,4,5,6,7,8,9] )
    }
    
    func testInsertAtTheBeginigAtOnceSuccessfuly(){
        arrayService.exposeInsertAtTheBeginigAtOnce()
        XCTAssertEqual( arrayService.getArray(), [0,1,2,0,1,2,3,4,5,6,7,8,9] )
    }
    
    func testInsertInTheMiddleOneByOneSuccessfuly(){
        arrayService.exposeInsertInTheMiddleOneByOne()
        XCTAssertEqual( arrayService.getArray(), [0,1,2,3,4,0,1,2,5,6,7,8,9] )
    }
    
    func testInsertInTheMiddleAtOnceSuccessfuly(){
        arrayService.exposeInsertInTheMiddleAtOnce()
        XCTAssertEqual( arrayService.getArray(), [0,1,2,3,4,0,1,2,5,6,7,8,9] )
    }
    
    func testAppendToTheEndOneByOneSuccessfuly(){
        arrayService.exposeAppendToTheEndOneByOne()
        XCTAssertEqual( arrayService.getArray(), [0,1,2,3,4,5,6,7,8,9,0,1,2] )
    }
    
    func testAppendToTheEndAtOnceSuccessfuly(){
        arrayService.exposeAppendToTheEndAtOnce()
        XCTAssertEqual( arrayService.getArray(), [0,1,2,3,4,5,6,7,8,9,0,1,2] )
    }
    
    func testRemoveAtTheBeginingOneByOneSuccessfuly(){
        arrayService.exposeRemoveAtTheBeginingOneByOne()
        XCTAssertEqual( arrayService.getArray(), [3,4,5,6,7,8,9] )
    }
    
    func testRemoveAtTheBeginigAtOnceSuccessfuly(){
        arrayService.exposeRemoveAtTheBeginigAtOnce()
        XCTAssertEqual( arrayService.getArray(), [3,4,5,6,7,8,9] )
    }
    
    func testRemoveInTheMiddleOneByOneSuccessfuly(){
        arrayService.exposeRemoveInTheMiddleOneByOne()
        XCTAssertEqual( arrayService.getArray(), [0,1,2,3,7,8,9] )
    }
    
    func testRemoveInTheMiddleAtOnceSuccessfuly(){
        arrayService.exposeRemoveInTheMiddleAtOnce()
        XCTAssertEqual( arrayService.getArray(), [0,1,2,3,7,8,9] )
    }
    
    func testRemoveAtTheEndOneByOneSuccessfuly(){
        arrayService.exposeRemoveAtTheEndOneByOne()
        XCTAssertEqual( arrayService.getArray(), [0,1,2,3,4,5,6] )
    }
    
    func testRemoveAtTheEndAtOnceSuccessfuly(){
        arrayService.exposeRemoveAtTheEndAtOnce()
        XCTAssertEqual( arrayService.getArray(), [0,1,2,3,4,5,6] )
    }    
}
