//
//  MainViewController.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 07.02.2023.
//

import UIKit

class MainTabelViewController: UITableViewController {
    
    @IBOutlet var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableHeaderView = createHeaderWithLabel(text: "Collections", fontSize: 34, fontWeight: .bold)
    }
    
    func createHeaderWithLabel(text: String, fontSize:  CGFloat, fontWeight: UIFont.Weight) -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0,
                                              width: self.tableView.frame.width, height: 40))
        let label = UILabel(frame: CGRect(x: 16, y: 10,
                                          width: self.tableView.frame.width, height: 40))
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        headerView.addSubview(label)
        return headerView
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



