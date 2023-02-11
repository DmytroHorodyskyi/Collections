//
//  ArrayCollectionViewController.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 08.02.2023.
//

import UIKit

class ArrayViewController: UIViewController {
    
    @IBOutlet weak var arrayCollectionView: UICollectionView!
    var model = ArrayModel()
    
    let cellName = [
        "Create Int array with 10_000_000elements",
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
        cell?.cellLabel.text = cellName[indexPath.row]
        cell?.backgroundColor = UIColor.lightGray
        if indexPath.row != 0 {
                cell?.isHidden = true
        }
        cell?.cellActivityIndicator.isHidden = true
        return cell ?? UICollectionViewCell()
    }
    
    func setCell(_ cell: ArrayCollectionViewCell, showIndicator indicator: Bool, backgraundColor color: UIColor? = nil, label text: String) {
        if indicator {
            cell.cellActivityIndicator.isHidden = false
            cell.cellActivityIndicator.startAnimating()
        } else {
            cell.cellActivityIndicator.stopAnimating()
            cell.cellActivityIndicator.isHidden = true
        }
        if let color = color {
            cell.backgroundColor = color
        }
        cell.cellLabel.text = text
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? ArrayCollectionViewCell else {return}
        let allCells = collectionView.visibleCells
        
        switch indexPath.row {
        case 0:
            setCell(cell, showIndicator: true, label: "")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                let time = self.model.getTimeOf(function: indexPath.row)
                allCells.forEach{ $0.isHidden = false }
                let text = self.getLabelText(for: indexPath.row, with: time)
                self.setCell(cell, showIndicator: false, backgraundColor: .white, label: text)
            }
        default:
            setCell(cell, showIndicator: true, label: "")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                let time = self.model.getTimeOf(function: indexPath.row)
                let text = self.getLabelText(for: indexPath.row, with: time)
                self.setCell(cell, showIndicator: false, backgraundColor: .white, label: text)
            }
        }
    }
}


class ArrayCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cellLabel: UILabel!
}
