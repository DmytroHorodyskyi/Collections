//
//  Array.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 09.02.2023.
//

import Foundation

struct ArrayService {
    
    private var array = [Int]()
    private let auxiliaryArray = Array(0..<1000)
    private let arrayOperationsQueue = DispatchQueue(label: "arrayOperationsQueue")
    
    private mutating func generateArray() {
        array = []
        for element in 0..<10_000_000 {
            array.append(element + 1)
        }
    }
    
    private mutating func insertAtTheBeginigOneByOne() {
        for (index, element) in auxiliaryArray.enumerated() {
            array.insert(element, at: index)
        }
    }
    
    private mutating func insertAtTheBeginigAtOnce() {
        array.insert(contentsOf: auxiliaryArray, at: 0)
    }
    
    private mutating func insertInTheMiddleOneByOne() {
        for (index, element) in auxiliaryArray.enumerated() {
            array.insert(element, at: (array.count - 1) / 2 + index)
        }
    }
    
    private mutating func insertInTheMiddleAtOnce() {
        array.insert(contentsOf: auxiliaryArray, at: (array.count - 1) / 2)
    }
    
    private mutating func appendToTheEndOneByOne() {
        for element in auxiliaryArray {
            array.append(element)
        }
    }
    
    private mutating func appendToTheEndAtOnce() {
        array.append(contentsOf: auxiliaryArray)
    }
    
    private mutating func removeAtTheBeginingOneByOne() {
        guard array.contains(1000) else {return}
        for _ in auxiliaryArray {
            array.removeFirst()
        }
    }
    
    private mutating func removeAtTheBeginigAtOnce() {
        guard array.contains(1000) else {return}
        array.removeFirst(1000)
    }
    
    private mutating func removeInTheMiddleOneByOne() {
        guard array.contains(1000) else {return}
        for _ in auxiliaryArray {
            array.remove(at: (array.count - 1) / 2)
        }
    }
    
    private mutating func removeInTheMiddleAtOnce() {
        guard array.contains(1000) else {return}
        array.removeSubrange(((array.count - 1) / 2 - 500)...((array.count - 1) / 2 + 500))
    }
    
    private mutating func removeAtTheEndOneByOne() {
        guard array.contains(1000) else {return}
        for _ in auxiliaryArray {
            array.removeLast()
        }
    }
    
    private mutating func removeAtTheEndAtOnce() {
        guard array.contains(1000) else {return}
        array.removeLast(1000)
    }
    
    
    private mutating func runOperationWith(at identifiersRepository: ArrayIdentifiersRepository) {
        
        switch identifiersRepository {
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
            runOperationWith(at: identifier)
            let end = DispatchTime.now()
            let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
            let timeInterval = Double(nanoTime) / 1_000_000
            return String(format: "%.2f", timeInterval)
        }
    }
}

#if DEBUG
extension ArrayService {
    public mutating func privateGenerateArray() {
        self.generateArray()
    }
}
#endif
