//
//  MainViewController.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 07.02.2023.
//

import UIKit

class MainViewController: UITableViewController {
    
    @IBOutlet var mainTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerview = UIView(frame: CGRect(x: 0, y: 0,
                                              width: self.mainTable.frame.width, height: 40))
        let label = UILabel(frame: CGRect(x: 16, y: 10,
                                          width: self.mainTable.frame.width, height: 40))
        label.text = "Collections"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        headerview.addSubview(label)
        self.mainTable.tableHeaderView = headerview
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 1:
            performSegue(withIdentifier: "showSet", sender: nil)
        case 2:
            let mainStoryboard = UIStoryboard(name: "Dictionary", bundle: Bundle.main)
            
            guard let dictionaryViewController = mainStoryboard.instantiateViewController(withIdentifier: "DictionaryViewController")
                    as? DictionaryViewController else { return }
            navigationController?.pushViewController(dictionaryViewController, animated: true)
        default:
            return
        }
    }
    
}



