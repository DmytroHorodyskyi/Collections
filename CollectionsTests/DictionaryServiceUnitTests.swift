//
//  DictionaryServiceTests.swift
//  CollectionsTests
//
//  Created by Dmytro Horodyskyi on 17.02.2023.
//

import XCTest
@testable import Collections

final class DictionaryServiceUnitTests: XCTestCase {

    var dictionarySevice: DictionaryService!

    override func setUp() {
        super.setUp()
        dictionarySevice = DictionaryService()
        dictionarySevice.generateCollections()
    }

    override func tearDown() {
        dictionarySevice = nil
        super.tearDown()
    }

    func testGenerateCollections() {
        let expected = 10_000_000
        XCTAssertEqual(dictionarySevice.arrayOfNames.count, expected)
        XCTAssertEqual(dictionarySevice.arrayOfPhones.count, expected)
        XCTAssertEqual(dictionarySevice.dictionaryOfContacts.count, expected)
    }
    
    func testFindFirstElementOfArraySuccessfuly() {
        XCTAssertEqual(dictionarySevice.findFirstElementOfArray(), "+38 050 0")
    }

    func testFindFirstElementOfDictinarySuccessfuly() {
        XCTAssertEqual(dictionarySevice.findFirstElementOfDictinary(), "+38 050 0")
    }
    
    func testFindLastElementOfArraySuccessfuly() {
        XCTAssertEqual(dictionarySevice.findLastElementOfArray(), "+38 050 9999999")
    }
    
    func testFindLastElementOfDictionary() {
        XCTAssertEqual(dictionarySevice.findLastElementOfDictionary(), "+38 050 9999999")
    }
    
    func testSearchForNonExistingElementOfArray() {
        XCTAssertEqual(dictionarySevice.searchForNonExistingElementOfArray(),
                       "does not exist")
    }
    
    func testSearchForNonExistingElementOfDictionary() {
        XCTAssertEqual(dictionarySevice.searchForNonExistingElementOfDictionary(),
                       "does not exist")
    }
}
