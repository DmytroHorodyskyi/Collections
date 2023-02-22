//
//  ArrayIdentifiersRepository.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 17.02.2023.
//

import Foundation

enum ArrayIdentifiersRepository: String, CaseIterable {
    case generateArray = "Create Int array with 10_000_000 elements"
    case insertAtTheBeginigOneByOne = "Insert at the beginning of an array 1000 elements one-by-one"
    case insertAtTheBeginigAtOnce = "Insert at the beginning of an array 1000 elements at once"
    case insertInTheMiddleOneByOne = "Insert in the middle of an array 1000 elements one-by-one"
    case insertInTheMiddleAtOnce = "Insert in the middle of an array 1000 elements at once"
    case appendToTheEndOneByOne = "Append to the end of an array 1000 elements one-by-one"
    case appendToTheEndAtOnce = "Append to the end of an array 1000 elements at once"
    case removeAtTheBeginingOneByOne = "Remove at the beginning 1000 elements one-by-one"
    case removeAtTheBeginigAtOnce = "Remove at the beginning 1000 elements at once"
    case removeInTheMiddleOneByOne = "Remove in the middle 1000 elements one-by-one"
    case removeInTheMiddleAtOnce = "Remove in the middle 1000 elements at once"
    case removeAtTheEndOneByOne = "Remove at the end 1000 elements one-by-one"
    case removeAtTheEndAtOnce = "Remove at the end 1000 elements at once"
    case none
}
