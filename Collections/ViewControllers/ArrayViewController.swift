//
//  ArrayCollectionViewController.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 08.02.2023.
//

import UIKit

class ArrayViewController: UIViewController {
    
    @IBOutlet weak var arrayCollectionView: UICollectionView!
    var arrayService = ArrayService()
    var cellName = ["Create Int array with 10_000_000 elements"]
    let namesOfSecondaryCells = [
                 "Insert at the beginning of an array 1000 elements one-by-one",
                 "Insert at the beginning of an array 1000 elements at once",
                 "Insert in the middle of an array 1000 elements one-by-on,e",
                 "Insert in the middle of an array 1000 elements at once",
                 "Append to the end of an array 1000 elements one-by-one",
                 "Append to the end of an array 1000 elements at once",
                 "Remove at the beginning 1000 elements one-by-one",
                 "Remove at the beginning 1000 elements at once",
                 "Remove in the middle 1000 elements one-by-one",
                 "Remove in the middle 1000 elements at once",
                 "Remove at the end 1000 elements one-by-one",
                 "Remove at the end 1000 elements at once"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getLabelText(for cell: Int, with time: String) -> String {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
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
        return cellName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArrayCell", for: indexPath) as? ArrayCollectionViewCell
        cell?.backgroundColor = UIColor.lightGray
        cell?.cellLabel.text = cellName[indexPath.row]
        cell?.cellActivityIndicator.isHidden = true
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? ArrayCollectionViewCell else {return}
        cell.setCell(cell, showIndicator: true, label: "")
        var time = String()
        var text = String()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [self] in
            time = self.arrayService.getTimeOf(function: IdentifiersRepository(rawValue: indexPath.row) ?? .generateArray)
            text = self.getLabelText(for: indexPath.row, with: time)
            if !cellName.contains(namesOfSecondaryCells) {
                cellName.append(contentsOf: namesOfSecondaryCells)
            }
            if indexPath.row == 0 {
                collectionView.reloadData()
            }
            cell.setCell(cell, showIndicator: false, backgraundColor: .white, label: text)
        }
    }
}

