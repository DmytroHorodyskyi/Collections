//
//  Array.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 09.02.2023.
//

import Foundation

struct ArrayService {
    
    var array = [Int]()
    private var auxiliaryArray = [Int]()
    private let arrayOperationsQueue = DispatchQueue(label: "arrayOperationsQueue")
    
    mutating func generateAuxiliaryArray() {
        auxiliaryArray = Array(0..<1_000)
    }
    
    mutating func generateArray() {
        array = Array(0..<10_000_000)
        generateAuxiliaryArray()
    }
    
    mutating func insertAtTheBeginigOneByOne() {
        for (index, element) in auxiliaryArray.enumerated() {
            array.insert(element, at: index)
        }
    }
    
    mutating func insertAtTheBeginigAtOnce() {
        array.insert(contentsOf: auxiliaryArray, at: 0)
    }
    
    mutating func insertInTheMiddleOneByOne() {
        var index = (array.count) / 2
        for element in auxiliaryArray {
            array.insert(element, at: index )
            index += 1
        }
    }
    
    mutating func insertInTheMiddleAtOnce() {
        array.insert(contentsOf: auxiliaryArray, at: (array.count) / 2)
    }
    
    mutating func appendToTheEndOneByOne() {
        for element in auxiliaryArray {
            array.append(element)
        }
    }
    
    mutating func appendToTheEndAtOnce() {
        array.append(contentsOf: auxiliaryArray)
    }
    
    mutating func removeAtTheBeginingOneByOne() {
        guard array.contains(1_000) else {return}
        for _ in 0..<1_000 {
            array.removeFirst()
        }
    }
    
    mutating func removeAtTheBeginigAtOnce() {
        guard array.contains(auxiliaryArray.count) else {return}
        array.removeFirst(auxiliaryArray.count)
    }
    
    mutating func removeInTheMiddleOneByOne() {
        guard array.contains(auxiliaryArray.count) else {return}
        for _ in auxiliaryArray {
            array.remove(at: (array.count) / 2)
        }
    }
    
    mutating func removeInTheMiddleAtOnce() {
        guard array.contains(auxiliaryArray.count) else {return}
        array.removeSubrange(((array.count) / 2 - auxiliaryArray.count / 2)..<((array.count) / 2 - auxiliaryArray.count / 2) + auxiliaryArray.count)
    }
    
    mutating func removeAtTheEndOneByOne() {
        guard array.contains(auxiliaryArray.count) else {return}
        for _ in auxiliaryArray {
            array.removeLast()
        }
    }
    
    mutating func removeAtTheEndAtOnce() {
        guard array.contains(auxiliaryArray.count) else {return}
        array.removeLast(auxiliaryArray.count)
    }
    
    
    private mutating func runOperation(at identifier: ArrayIdentifiersRepository) {
        
        switch identifier {
        case .generateArray:
            generateArray()
        case .insertAtTheBeginigOneByOne:
            insertAtTheBeginigOneByOne()
        case .insertAtTheBeginigAtOnce:
            insertAtTheBeginigAtOnce()
        case .insertInTheMiddleOneByOne:
            insertInTheMiddleOneByOne()
        case .insertInTheMiddleAtOnce:
            insertInTheMiddleAtOnce()
        case .appendToTheEndOneByOne:
            appendToTheEndOneByOne()
        case .appendToTheEndAtOnce:
            appendToTheEndAtOnce()
        case .removeAtTheBeginingOneByOne:
            removeAtTheBeginingOneByOne()
        case .removeAtTheBeginigAtOnce:
            removeAtTheBeginigAtOnce()
        case .removeInTheMiddleOneByOne:
            removeInTheMiddleOneByOne()
        case .removeInTheMiddleAtOnce:
            removeInTheMiddleAtOnce()
        case .removeAtTheEndOneByOne:
            removeAtTheEndOneByOne()
        case .removeAtTheEndAtOnce:
            removeAtTheEndAtOnce()
        case .none:
            return
        }
    }
    
    mutating func getTimeOf(function identifier: ArrayIdentifiersRepository) -> String {
        arrayOperationsQueue.sync {
            let start = DispatchTime.now()
            runOperation(at: identifier)
            let end = DispatchTime.now()
            let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
            let timeInterval = Double(nanoTime) / 1_000_000
            return String(format: "%.2f", timeInterval)
        }
    }
}
