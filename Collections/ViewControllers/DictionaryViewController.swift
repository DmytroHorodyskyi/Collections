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
    private var dictionaryService = DictionaryService()
    private let cellNames: [String] = DictionaryIdentifiersRepository
        .allCases
        .filter() {$0 != .none}
        .map() {$0.rawValue}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpCollectionViewFor(loading: Bool) {
        if loading {
            dictionaryCollectionView.isHidden = true
            mainActivityIndicator.startAnimating()
        } else {
            dictionaryService.generateCollections()
            mainActivityIndicator.stopAnimating()
            dictionaryCollectionView.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpCollectionViewFor(loading: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpCollectionViewFor(loading: false)
    }

    private func getLabelText(for cell: Int, with time: String, with element: String) -> String {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: ((collectionView.bounds.width) / 2) - 2,
                              height: (collectionView.bounds.height) / 8 )
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "DictionaryHeader", for: indexPath) as UICollectionReusableView
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellNames.count * 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DictionaryCell", for: indexPath) as? DictionaryCollectionViewCell else {return UICollectionViewCell()}
        cell.setUpCell(label: cellNames[indexPath.row / 2])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? DictionaryCollectionViewCell else {return}
        cell.setUpCell(showIndicator: true, label: "")
        
        DispatchQueue.global().async {
            let timeAndResult = self.dictionaryService.getTimeAndResultOf(function: DictionaryIdentifiersRepository(rawValue: self.cellNames[indexPath.row / 2]) ?? .none, ofArray: indexPath.row % 2 == 0)
            
            DispatchQueue.main.async {
                let text = self.getLabelText(for: indexPath.row, with: timeAndResult.0, with: timeAndResult.1)
                cell.setUpCell(showIndicator: false, label: text)
            }
        }
    }
}

