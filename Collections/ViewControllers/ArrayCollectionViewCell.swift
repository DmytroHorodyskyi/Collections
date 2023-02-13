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
}
