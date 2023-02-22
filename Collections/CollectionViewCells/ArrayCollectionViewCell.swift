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
    
    func setUpCell(showIndicator indicator: Bool? = nil, label text: String) {
        switch indicator {
        case true:
            self.cellActivityIndicator.startAnimating()
        case false:
            self.cellActivityIndicator.stopAnimating()
            cellView.backgroundColor = UIColor.white
        default:
            cellView.backgroundColor = UIColor.lightGray
        }
        self.cellLabel.text = text
    }
}
