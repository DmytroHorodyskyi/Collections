//
//  DictionaryModel.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 09.02.2023.
//

import Foundation

struct DictionaryService {
    
    var arrayOfNames = [String]()
    var arrayOfPhones = [String]()
    var dictionaryOfContacts = [String:String]()

    mutating func generateCollections() {
        for element in 0..<10_000_000 {
            arrayOfNames.append("Name\(element)")
            arrayOfPhones.append("+38 050 \(element)")
            dictionaryOfContacts["Name\(element)"] = "+38 050 \(element)"
        }
    }
    
    func findFirstElementOfArray() -> String {
        guard let index = arrayOfNames.firstIndex(of: "Name0") else {return "does not exist"}
        return arrayOfPhones[index]
    }
    
    func findFirstElementOfDictinary() -> String {
        dictionaryOfContacts["Name0"] ?? ""
    }
    
    func findLastElementOfArray() -> String {
        guard let index = arrayOfNames.firstIndex(of: "Name\(arrayOfNames.count - 1)") else {return "does not exist"}
        return arrayOfPhones[index]
    }
    
    func findLastElementOfDictionary() -> String {
        dictionaryOfContacts["Name\(arrayOfNames.count - 1)"] ?? ""
    }
    
    func searchForNonExistingElementOfArray() -> String {
        guard let index = arrayOfNames.firstIndex(of: "Unknown Name") else {return "does not exist"}
        return arrayOfPhones[index]
    }
    
    func searchForNonExistingElementOfDictionary() -> String {
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
