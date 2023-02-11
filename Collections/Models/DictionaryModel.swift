//
//  DictionaryModel.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 09.02.2023.
//

import Foundation

struct DictionaryModel {
    var arrayOfNames = [String]()
    var arrayOfPhones = [String]()
    var dictionaryOfContacts = [String:String]()
    
    mutating func generateCollectionsOf(_ quantity: Int) {
        for element in 0..<quantity {
                arrayOfNames.append("Name\(element)")
                arrayOfPhones.append("+38 050 \(element)")
                dictionaryOfContacts["Name\(element)"] = "+38 050 \(element)"
        }
    }
    
    func findFirstElementOfArray() -> String {
        guard let index = arrayOfNames.firstIndex(of: "Name0")
        else { return "does not exist" }
            return arrayOfPhones[index]
    }
    
    func findFirstElementOfDictinary() -> String {
        dictionaryOfContacts["Name0"] ?? ""
    }
    
    func findLastElementOfArray() -> String {
        guard let index = arrayOfNames.firstIndex(of: "Name999999")
        else { return "does not exist" }
            return arrayOfPhones[index]
    }
    
    func findLastElementOfDictionary() -> String {
        dictionaryOfContacts["Name999999"] ?? ""
    }
    
    func searchForNonExistingElementOfArray() -> String {
        guard let index = arrayOfNames.firstIndex(of: "Unknown Name")
        else { return "does not exist" }
            return arrayOfPhones[index]

    }
    
    func searchForNonExistingElementOfDictionary() -> String {
        dictionaryOfContacts["Unknown Name"] ?? "does not exist"
    }
    
    func doFunction(at index: Int) -> String {
        switch index {
        case 0:
            return findFirstElementOfArray()
        case 1:
            return findFirstElementOfDictinary()
        case 2:
            return findLastElementOfArray()
        case 3:
            return findLastElementOfDictionary()
        case 4:
            return searchForNonExistingElementOfArray()
        case 5:
            return searchForNonExistingElementOfDictionary()
        default:
            return ""
        }
    }
    
    func getTimeAndResultOf(function number: Int) -> (String, String) {
        let start = DispatchTime.now()
        let result = doFunction(at: number)
        let end = DispatchTime.now()
        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoTime) / 1_000_000
        return (String(format: "%.2f", timeInterval), result)
    }
}
