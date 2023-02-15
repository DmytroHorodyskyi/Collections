//
//  ArrayCollectionViewCell.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 13.02.2023.
//

import UIKit

class ArrayCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cellLabel: UILabel!
    
    func setUpCell(showIndicator indicator: Bool, label text: String) {
        if indicator {
            self.cellActivityIndicator.isHidden = false
            self.cellActivityIndicator.startAnimating()
        } else {
            self.cellActivityIndicator.stopAnimating()
            self.cellActivityIndicator.isHidden = true
            cellView.backgroundColor = UIColor.white
        }
        self.cellLabel.text = text
    }
}
