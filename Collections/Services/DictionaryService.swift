//
//  DictionaryModel.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 09.02.2023.
//

import Foundation

struct DictionaryService {
    
    private var arrayOfNames = [String]()
    private var arrayOfPhones = [String]()
    private var dictionaryOfContacts = [String:String]()
    public let collectionsSize = 10_000_000

    mutating func generateCollections(of numbers: Int) {
        for element in 0..<numbers {
            arrayOfNames.append("Name\(element)")
            arrayOfPhones.append("+38 050 \(element)")
            dictionaryOfContacts["Name\(element)"] = "+38 050 \(element)"
        }
    }
    
    private func findFirstElementOfArray() -> String {
        guard let index = arrayOfNames.firstIndex(of: "Name0") else {return "does not exist"}
        return arrayOfPhones[index]
    }
    
    private func findFirstElementOfDictinary() -> String {
        dictionaryOfContacts["Name0"] ?? ""
    }
    
    private func findLastElementOfArray() -> String {
        guard let index = arrayOfNames.firstIndex(of: "Name\(arrayOfNames.count - 1)") else {return "does not exist"}
        return arrayOfPhones[index]
    }
    
    private func findLastElementOfDictionary() -> String {
        dictionaryOfContacts["Name\(arrayOfNames.count - 1)"] ?? ""
    }
    
    private func searchForNonExistingElementOfArray() -> String {
        guard let index = arrayOfNames.firstIndex(of: "Unknown Name") else {return "does not exist"}
        return arrayOfPhones[index]
    }
    
    private func searchForNonExistingElementOfDictionary() -> String {
        dictionaryOfContacts["Unknown Name"] ?? "does not exist"
    }
    
    private func runOperation(at identifiersRepository: DictionaryIdentifiersRepository, ofArray: Bool) -> String {
        switch (identifiersRepository, ofArray) {
        case (.findFirstElement, true):
            return findFirstElementOfArray()
        case (.findFirstElement, false):
            return findFirstElementOfDictinary()
        case (.findLastElement, true):
            return findLastElementOfArray()
        case (.findLastElement, false):
            return findLastElementOfDictionary()
        case (.searchForNonExistingElement, true):
            return searchForNonExistingElementOfArray()
        case (.searchForNonExistingElement, false):
            return searchForNonExistingElementOfDictionary()
        case (.none, _):
            return ""
        }
    }
    
    func getTimeAndResultOf(function identifier: DictionaryIdentifiersRepository, ofArray: Bool) -> (String, String) {
        let start = DispatchTime.now()
        let result = runOperation(at: identifier, ofArray: ofArray)
        let end = DispatchTime.now()
        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoTime) / 1_000_000
        return (String(format: "%.2f", timeInterval), result)
    }
}

#if DEBUG
extension DictionaryService {
    
    public func getArrayOfNames() -> [String] {
        arrayOfNames
    }
    public func getArrayOfPhones() -> [String] {
        arrayOfPhones
    }
    public func getDictionaryOfContacts() -> [String:String] {
        dictionaryOfContacts
    }
    public mutating func exposeFindFirstElementOfArray() -> String {
        findFirstElementOfArray()
    }
    public mutating func exposeFindFirstElementOfDictinary() -> String {
        findFirstElementOfDictinary()
    }
    public mutating func exposeFindLastElementOfArray() -> String {
        findLastElementOfArray()
    }
    public mutating func exposeFindLastElementOfDictionary() -> String {
        findLastElementOfDictionary()
    }
    public mutating func exposeSearchForNonExistingElementOfArray() -> String {
        searchForNonExistingElementOfArray()
    }
    public mutating func exposeSearchForNonExistingElementOfDictionary() -> String {
        searchForNonExistingElementOfDictionary()
    }
}
#endif
