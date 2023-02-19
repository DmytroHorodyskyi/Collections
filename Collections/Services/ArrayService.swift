//
//  Array.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 09.02.2023.
//

import Foundation

struct ArrayService {
    
    private let arraySize = 10_000_000
    private let auxiliaryArraySize = 1_000
    private var array = [Int]()
    private var auxiliaryArray = [Int]()
    private let arrayOperationsQueue = DispatchQueue(label: "arrayOperationsQueue")
    
    private mutating func generateAuxiliaryArray(of numbers: Int) {
        auxiliaryArray = Array(0..<numbers)
    }
    
    private mutating func generateArray(of numbers: Int) {
        array = Array(0..<numbers)
        generateAuxiliaryArray(of: auxiliaryArraySize)
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
        var index = (array.count) / 2
        for element in auxiliaryArray {
            array.insert(element, at: index )
            index += 1
        }
    }
    
    private mutating func insertInTheMiddleAtOnce() {
        array.insert(contentsOf: auxiliaryArray, at: (array.count) / 2)
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
        guard array.contains(auxiliaryArray.count) else {return}
        for _ in auxiliaryArray {
            array.removeFirst()
        }
    }
    
    private mutating func removeAtTheBeginigAtOnce() {
        guard array.contains(auxiliaryArray.count) else {return}
        array.removeFirst(auxiliaryArray.count)
    }
    
    private mutating func removeInTheMiddleOneByOne() {
        guard array.contains(auxiliaryArray.count) else {return}
        for _ in auxiliaryArray {
            array.remove(at: (array.count) / 2)
        }
    }
    
    private mutating func removeInTheMiddleAtOnce() {
        guard array.contains(auxiliaryArray.count) else {return}
        array.removeSubrange(((array.count) / 2 - auxiliaryArray.count / 2)..<((array.count) / 2 - auxiliaryArray.count / 2) + auxiliaryArray.count)
    }
    
    private mutating func removeAtTheEndOneByOne() {
        guard array.contains(auxiliaryArray.count) else {return}
        for _ in auxiliaryArray {
            array.removeLast()
        }
    }
    
    private mutating func removeAtTheEndAtOnce() {
        guard array.contains(auxiliaryArray.count) else {return}
        array.removeLast(auxiliaryArray.count)
    }
    
    
    private mutating func runOperation(at identifier: ArrayIdentifiersRepository) {
        
        switch identifier {
        case .generateArray:
            generateArray(of: arraySize)
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

#if DEBUG
extension ArrayService {
    
    public func getArray() -> [Int] {
        array
    }
    public mutating func exposeGenerateAuxiliaryArray(size: Int) {
        generateAuxiliaryArray(of: size)
    }
    public mutating func exposeGenerateArray(size: Int) {
        generateArray(of: size)
    }
    public mutating func exposeInsertAtTheBeginigOneByOne() {
        insertAtTheBeginigOneByOne()
    }
    public mutating func exposeInsertAtTheBeginigAtOnce() {
        insertAtTheBeginigAtOnce()
    }
    public mutating func exposeInsertInTheMiddleOneByOne() {
        insertInTheMiddleOneByOne()
    }
    public mutating func exposeInsertInTheMiddleAtOnce() {
        insertInTheMiddleAtOnce()
    }
    public mutating func exposeAppendToTheEndOneByOne() {
        appendToTheEndOneByOne()
    }
    public mutating func exposeAppendToTheEndAtOnce() {
        appendToTheEndAtOnce()
    }
    public mutating func exposeRemoveAtTheBeginingOneByOne() {
        removeAtTheBeginingOneByOne()
    }
    public mutating func exposeRemoveAtTheBeginigAtOnce() {
        removeAtTheBeginigAtOnce()
    }
    public mutating func exposeRemoveInTheMiddleOneByOne() {
        removeInTheMiddleOneByOne()
    }
    public mutating func exposeRemoveInTheMiddleAtOnce() {
        removeInTheMiddleAtOnce()
    }
    public mutating func exposeRemoveAtTheEndOneByOne() {
        removeAtTheEndOneByOne()
    }
    public mutating func exposeRemoveAtTheEndAtOnce() {
        removeAtTheEndAtOnce()
    }
}
#endif
