//
//  DictionaryCollectionViewController.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 09.02.2023.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    @IBOutlet weak var mainActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var dictionaryCollectionView: UICollectionView!
    var model = DictionaryModel()
    let cellName = [
        "Find the first contact",
        "Find the last contact",
        "Search for a non-existing element"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dictionaryCollectionView.isHidden = true
        mainActivityIndicator.isHidden = false
        mainActivityIndicator.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        model.generateCollectionsOf(1_000_000)
        mainActivityIndicator.isHidden = true
        mainActivityIndicator.stopAnimating()
        dictionaryCollectionView.isHidden = false
    }

    func getLabelText(for cell: Int, with time: String, with element: String) -> String {
        switch cell {
        case 0, 1:
            return "First element search time: \(time) ms. Result number: \(element)"
        case 2, 3:
            return "Last element search time: \(time) ms. Result number: \(element)"
        case 4, 5:
            return "Non-existing element search time: \(time) ms. Result number: \(element)"
        default:
            return ""
        }
    }
}


extension DictionaryViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: 0, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        let cellSize = CGSize(width: ((collectionView.bounds.width) / 2) - 2,
                              height: (collectionView.bounds.height) / 8 )
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "DictionaryHeader", for: indexPath) as UICollectionReusableView
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellName.count * 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DictionaryCell", for: indexPath) as? DictionaryCollectionViewCell
        cell?.cellLabel.text = cellName[indexPath.row / 2]
        cell?.backgroundColor = UIColor.lightGray
        cell?.cellActivityIndicator.isHidden = true
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? DictionaryCollectionViewCell
        cell?.cellLabel.text = ""
        cell?.cellActivityIndicator.isHidden = false
        cell?.cellActivityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let timeAndResult = self.model.getTimeAndResultOf(function: indexPath.row)
            cell?.cellActivityIndicator.isHidden = true
            cell?.cellActivityIndicator.stopAnimating()
            cell?.backgroundColor = UIColor.white
            cell?.cellLabel.text = self.getLabelText(for: indexPath.row, with: timeAndResult.0, with: timeAndResult.1)
        }
    }
}


class DictionaryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cellLabel: UILabel!

}
