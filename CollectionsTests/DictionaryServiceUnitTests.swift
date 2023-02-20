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
        dictionarySevice.generateCollections(of: 5)
    }

    override func tearDown() {
        dictionarySevice = nil
        super.tearDown()
    }

    func testGenerateCollections() {
        XCTAssertEqual(dictionarySevice.arrayOfNames,
                       ["Name0", "Name1", "Name2", "Name3", "Name4"])
        XCTAssertEqual(dictionarySevice.arrayOfPhones,
                       ["+38 050 0", "+38 050 1", "+38 050 2", "+38 050 3", "+38 050 4"])
        XCTAssertEqual(dictionarySevice.dictionaryOfContacts,
                       ["Name0":"+38 050 0", "Name1":"+38 050 1", "Name2":"+38 050 2", "Name3":"+38 050 3", "Name4":"+38 050 4"])
    }
    
    func testFindFirstElementOfArraySuccessfuly() {
        XCTAssertEqual(dictionarySevice.findFirstElementOfArray(), "+38 050 0")
    }

    func testFindFirstElementOfDictinarySuccessfuly() {
        XCTAssertEqual(dictionarySevice.findFirstElementOfDictinary(), "+38 050 0")
    }
    
    func testFindLastElementOfArraySuccessfuly() {
        XCTAssertEqual(dictionarySevice.findLastElementOfArray(), "+38 050 4")
    }
    
    func testFindLastElementOfDictionary() {
        XCTAssertEqual(dictionarySevice.findLastElementOfDictionary(), "+38 050 4")
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
