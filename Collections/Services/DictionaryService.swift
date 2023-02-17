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
    
    mutating func generateCollections() {
        for element in 0..<10_000_000 {
            arrayOfNames.append("Name\(element)")
            arrayOfPhones.append("+38 050 \(element)")
            dictionaryOfContacts["Name\(element)"] = "+38 050 \(element)"
        }
    }
    
    private func findFirstElementOfArray() -> String {
        arrayOfPhones[arrayOfNames.firstIndex(of: "Name0") ?? 0]
    }
    
    private func findFirstElementOfDictinary() -> String {
        dictionaryOfContacts["Name0"] ?? ""
    }
    
    private func findLastElementOfArray() -> String {
        arrayOfPhones[arrayOfNames.firstIndex(of: "Name999999") ?? 0]
    }
    
    private func findLastElementOfDictionary() -> String {
        dictionaryOfContacts["Name999999"] ?? ""
    }
    
    private func searchForNonExistingElementOfArray() -> String {
        arrayOfPhones[arrayOfNames.firstIndex(of: "Unknown Name") ?? 0]
        
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
