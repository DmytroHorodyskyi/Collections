//
//  SetModel.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 09.02.2023.
//

import Foundation

struct SetService {
    
    func intersection(_ string1: String, _ string2: String) -> String {
        let mainSet = Set(string1)
        let auxiliarySet = Set(string2)
        return String(mainSet.intersection(auxiliarySet))
    }

    func symmetricDifference(_ string1: String, _ string2: String) -> String {
        let mainSet = Set(string1)
        let auxiliarySet = Set(string2)
        return String(mainSet.symmetricDifference(auxiliarySet))
    }
    
    func subtracting(_ string1: String, _ string2: String) -> String {
        let mainSet = Set(string1)
        let auxiliarySet = Set(string2)
        return String(mainSet.subtracting(auxiliarySet))
    }
    
}
