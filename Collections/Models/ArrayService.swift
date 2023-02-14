//
//  Array.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 09.02.2023.
//

import Foundation

enum ArrayIdentifiersRepository: Int {
    case generateArray = 0
    case insertAtTheBeginigOneByOne = 1
    case insertAtTheBeginigAtOnce = 2
    case insertInTheMiddleOneByOne = 3
    case insertInTheMiddleAtOnce = 4
    case appendToTheEndOneByOne = 5
    case appendToTheEndAtOnce = 6
    case removeAtTheBeginingOneByOne = 7
    case removeAtTheBeginigAtOnce = 8
    case removeInTheMiddleOneByOne = 9
    case removeInTheMiddleAtOnce = 10
    case removeAtTheEndOneByOne = 11
    case removeAtTheEndAtOnce = 12
    case none
}

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
        let middleIndex = (array.count - 1) / 2
        for (index, element) in auxiliaryArray.enumerated() {
            array.insert(element, at: middleIndex + index)
        }
    }
    
    private mutating func insertInTheMiddleAtOnce() {
        let middleIndex = (array.count - 1) / 2
        array.insert(contentsOf: auxiliaryArray, at: middleIndex)
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
        let middleIndex = (array.count - 1) / 2
        array.removeSubrange((middleIndex - 500)...(middleIndex + 500))
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


