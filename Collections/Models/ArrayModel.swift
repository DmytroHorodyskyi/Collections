//
//  Array.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 09.02.2023.
//

import Foundation

struct ArrayModel {
    
    var array = [Int]()
    let auxiliaryArray = Array(0...1000)
    
    mutating func generateArray() {
        for element in 0..<10_000_000 {
            array.append(element + 1)
        }
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
        for (index, element) in auxiliaryArray.enumerated() {
            array.insert(element, at: index + 2000)
        }
    }
    
    mutating func insertInTheMiddleAtOnce() {
        array.insert(contentsOf: auxiliaryArray, at: 2000)
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
        for _ in auxiliaryArray {
            array.removeFirst()
        }
    }
    
    mutating func removeAtTheBeginigAtOnce() {
        array.removeFirst(1000)
    }
    
    mutating func removeInTheMiddleOneByOne() {
        for _ in auxiliaryArray {
            array.remove(at: 2000)
        }
    }
    
    mutating func removeInTheMiddleAtOnce() {
        array.removeSubrange(2000...2999)
    }
    
    mutating func removeAtTheEndOneByOne() {
        for _ in auxiliaryArray {
            array.removeLast()
        }
    }
    
    mutating func removeAtTheEndAtOnce() {
        array.removeLast(1000)
    }
    
    
    mutating func doFunction(at index: Int) {
        switch index {
        case 0:
            generateArray()
        case 1:
            insertAtTheBeginigOneByOne()
        case 2:
            insertAtTheBeginigAtOnce()
        case 3:
            insertInTheMiddleOneByOne()
        case 4:
            insertInTheMiddleAtOnce()
        case 5:
            appendToTheEndOneByOne()
        case 6:
            appendToTheEndAtOnce()
        case 7:
            removeAtTheBeginingOneByOne()
        case 8:
            removeAtTheBeginigAtOnce()
        case 9:
            removeInTheMiddleOneByOne()
        case 10:
            removeInTheMiddleAtOnce()
        case 11:
            removeAtTheEndOneByOne()
        case 12:
            removeAtTheEndAtOnce()
        default:
            break
        }
    }
    
    mutating func getTimeOf(function number: Int) -> String {
        let start = DispatchTime.now()
        doFunction(at: number)
        let end = DispatchTime.now()
        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoTime) / 1_000_000
        return String(format: "%.2f", timeInterval)
    }
}
