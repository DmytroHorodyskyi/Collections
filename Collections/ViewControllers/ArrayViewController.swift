//
//  ArrayCollectionViewController.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 08.02.2023.
//

import UIKit

class ArrayViewController: UIViewController {
    
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

    @IBOutlet weak var arrayCollectionView: UICollectionView!
    private var arrayService = ArrayService()
    private var declaredCellNames = ["Create Int array with 10_000_000 elements"]
    private let undeclaredCellNames: [String] = ArrayIdentifiersRepository
        .allCases
        .filter() {$0 != .generateArray && $0 != .none}
        .map() {$0.rawValue}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func getLabelText(for cell: Int, with time: String) -> String {
        switch cell {
        case 0:
            return "Array creation time: \(time) ms."
        case 1...6:
            return "Insertion time: \(time) ms."
        case 7...12:
            return "Removing time: \(time) ms."
        default:
            return ""
        }
    }
}


extension ArrayViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.row {
        case 0 :
            let cellSize = CGSize(width: (collectionView.bounds.width) , height: (collectionView.bounds.height) / 8 )
            return cellSize
        default:
            let cellSize = CGSize(width: ((collectionView.bounds.width) / 2) - 2  , height: (collectionView.bounds.height) / 8 )
            return cellSize
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return declaredCellNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArrayCell", for: indexPath) as? ArrayCollectionViewCell else {return UICollectionViewCell()}
        cell.cellView.backgroundColor = UIColor.lightGray
        cell.cellLabel.text = declaredCellNames[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ArrayCollectionViewCell else {return}
        cell.setUpCell(showIndicator: true, label: "")
        
        DispatchQueue.global().async {
            let time = self.arrayService.getTimeOf(function: ArrayViewController.ArrayIdentifiersRepository(rawValue: self.declaredCellNames[indexPath.row]) ?? .none)
            
            DispatchQueue.main.async { [self] in
                let text = self.getLabelText(for: indexPath.row, with: time)
                cell.setUpCell(showIndicator: false, label: text)
                guard indexPath.row == 0 else {return}
                if !declaredCellNames.contains(undeclaredCellNames) {
                    declaredCellNames.append(contentsOf: undeclaredCellNames)
                }
                collectionView.reloadData()
            }
        }
    }
}

