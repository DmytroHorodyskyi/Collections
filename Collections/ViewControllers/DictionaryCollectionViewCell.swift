//
//  DictioonaryViewControllerCell.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 13.02.2023.
//

import UIKit


class DictionaryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cellLabel: UILabel!

    func setUpCell(showIndicator indicator: Bool, label text: String) {
        if indicator {
            self.cellActivityIndicator.isHidden = false
            self.cellActivityIndicator.startAnimating()
        } else {
            self.cellActivityIndicator.stopAnimating()
            self.cellActivityIndicator.isHidden = true
            self.backgroundColor = UIColor.white
        }
        self.cellLabel.text = text
    }
}
