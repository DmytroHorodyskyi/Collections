//
//  DictionaryModel.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 09.02.2023.
//

import Foundation

enum DictionaryIdentifiersRepository: Int {
    case findFirstElementOfArray = 0
    case findFirstElementOfDictinary = 1
    case findLastElementOfArray = 2
    case findLastElementOfDictionary = 3
    case searchForNonExistingElementOfArray = 4
    case searchForNonExistingElementOfDictionary = 5
    case none
}

struct DictionaryService {
    
    var arrayOfNames = [String]()
    var arrayOfPhones = [String]()
    var dictionaryOfContacts = [String:String]()
    
    mutating func generateCollectionsOf(_ quantity: Int) {
        for element in 0..<quantity {
                arrayOfNames.append("Name\(element)")
                arrayOfPhones.append("+38 050 \(element)")
                dictionaryOfContacts["Name\(element)"] = "+38 050 \(element)"
        }
        print("generateCollectionsOf")
    }
    
    private func findFirstElementOfArray() -> String {
        guard let index = arrayOfNames.firstIndex(of: "Name0")
        else { return "does not exist" }
            return arrayOfPhones[index]
    }
    
    private func findFirstElementOfDictinary() -> String {
        dictionaryOfContacts["Name0"] ?? ""
    }
    
    private func findLastElementOfArray() -> String {
        guard let index = arrayOfNames.firstIndex(of: "Name999999")
        else { return "does not exist" }
            return arrayOfPhones[index]
    }
    
    private func findLastElementOfDictionary() -> String {
        dictionaryOfContacts["Name999999"] ?? ""
    }
    
    private func searchForNonExistingElementOfArray() -> String {
        guard let index = arrayOfNames.firstIndex(of: "Unknown Name")
        else { return "does not exist" }
            return arrayOfPhones[index]

    }
    
    private func searchForNonExistingElementOfDictionary() -> String {
        dictionaryOfContacts["Unknown Name"] ?? "does not exist"
    }
    
    private func runOperation(at identifiersRepository: DictionaryIdentifiersRepository) -> String {
        switch identifiersRepository {
        case .findFirstElementOfArray:
            return findFirstElementOfArray()
        case .findFirstElementOfDictinary:
            return findFirstElementOfDictinary()
        case .findLastElementOfArray:
            return findLastElementOfArray()
        case .findLastElementOfDictionary:
            return findLastElementOfDictionary()
        case .searchForNonExistingElementOfArray:
            return searchForNonExistingElementOfArray()
        case .searchForNonExistingElementOfDictionary:
            return searchForNonExistingElementOfDictionary()
        case .none:
            return ""
        }
    }
    
    func getTimeAndResultOf(function identifier: DictionaryIdentifiersRepository) -> (String, String) {
        let start = DispatchTime.now()
        let result = runOperation(at: identifier)
        let end = DispatchTime.now()
        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoTime) / 1_000_000
        return (String(format: "%.2f", timeInterval), result)
    }
}
