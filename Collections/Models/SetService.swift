//
//  SetModel.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 09.02.2023.
//

import Foundation

struct SetService {
    
    func intesection(in string1: String, and string2: String) -> String {
        let mainSet = Set(string1)
        let auxiliarySet = Set(string2)
        return String(mainSet.intersection(auxiliarySet))
    }

    func symmetricDifference(in string1: String, and string2: String) -> String {
        let mainSet = Set(string1)
        let auxiliarySet = Set(string2)
        return String(mainSet.symmetricDifference(auxiliarySet))
    }
    
    func subtracting(in string1: String, and string2: String) -> String {
        let mainSet = Set(string1)
        let auxiliarySet = Set(string2)
        return String(mainSet.subtracting(auxiliarySet))
    }
    
}
