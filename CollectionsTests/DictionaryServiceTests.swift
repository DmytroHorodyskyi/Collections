//
//  DictionaryServiceTests.swift
//  CollectionsTests
//
//  Created by Dmytro Horodyskyi on 17.02.2023.
//

import XCTest
@testable import Collections

final class DictionaryServiceTests: XCTestCase {

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
        XCTAssertEqual(dictionarySevice.getArrayOfNames(),
                       ["Name0", "Name1", "Name2", "Name3", "Name4"])
        XCTAssertEqual(dictionarySevice.getArrayOfPhones(),
                       ["+38 050 0", "+38 050 1", "+38 050 2", "+38 050 3", "+38 050 4"])
        XCTAssertEqual(dictionarySevice.getDictionaryOfContacts(),
                       ["Name0":"+38 050 0", "Name1":"+38 050 1", "Name2":"+38 050 2", "Name3":"+38 050 3", "Name4":"+38 050 4"])
    }
    
    func testFindFirstElementOfArraySuccessfuly() {
        XCTAssertEqual(dictionarySevice.exposeFindFirstElementOfArray(), "+38 050 0")
    }

    func testFindFirstElementOfDictinarySuccessfuly() {
        XCTAssertEqual(dictionarySevice.exposeFindFirstElementOfDictinary(), "+38 050 0")
    }
    
    func testFindLastElementOfArraySuccessfuly() {
        XCTAssertEqual(dictionarySevice.exposeFindLastElementOfArray(), "+38 050 4")
    }
    
    func testFindLastElementOfDictionary() {
        XCTAssertEqual(dictionarySevice.exposeFindLastElementOfDictionary(), "+38 050 4")
    }
    
    func testSearchForNonExistingElementOfArray() {
        XCTAssertEqual(dictionarySevice.exposeSearchForNonExistingElementOfArray(),
                       "does not exist")
    }
    
    func testSearchForNonExistingElementOfDictionary() {
        XCTAssertEqual(dictionarySevice.exposeSearchForNonExistingElementOfDictionary(),
                       "does not exist")
    }
}
