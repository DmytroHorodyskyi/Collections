//
//  SetViewController.swift
//  Collections
//
//  Created by Dmytro Horodyskyi on 09.02.2023.
//

import UIKit

class SetViewController: UIViewController {
    
    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var auxiliaryTextFiled: UITextField!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    private let setService = SetService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func removeDigits(from string: String) -> String{
        string.components(separatedBy: CharacterSet.decimalDigits).joined()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { super.touchesBegan (touches, with: event)
        view.endEditing (true)
    }
    
    @IBAction func mainTextFieldAction(_ sender: UITextField) {
        if let text = mainTextField.text {
            mainTextField.text = removeDigits(from: text)
        }
    }
    
    @IBAction func auxiliaryTextFieldAction(_ sender: UITextField) {
        if let text = auxiliaryTextFiled.text {
            auxiliaryTextFiled.text = removeDigits(from: text)
        }
    }
    
    @IBAction func AllMatchingLettersActionButton(_ sender: UIButton) {
        firstLabel.text = setService.intersection(mainTextField.text ?? "", auxiliaryTextFiled.text ?? "")
    }
    
    @IBAction func AllCharactersThatDoNotMatchButtonAction(_ sender: UIButton) {
        secondLabel.text = setService.symmetricDifference(mainTextField.text ?? "", auxiliaryTextFiled.text ?? "")
    }
    
    @IBAction func AllUniquecharactersFromTheFirsttextField(_ sender: UIButton) {
        thirdLabel.text = setService.subtracting(mainTextField.text ?? "", auxiliaryTextFiled.text ?? "")
    }
}

extension SetViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mainTextField.resignFirstResponder()
        auxiliaryTextFiled.resignFirstResponder()
        return true
    }
}
