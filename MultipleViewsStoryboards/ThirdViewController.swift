//
//  ThirdViewController.swift
//  MultipleViewsStoryboards
//
//  Created by Sandra Gomez on 4/29/24.
//

import UIKit

protocol MySecondProtocol {
    func sendBackData(thisData: String)
}

class ThirdViewController: UIViewController {
    
    @IBOutlet var myTextField: UITextField!
    var receivedData = ""
    var delegate: MySecondProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.text = receivedData
    }
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.sendBackData(thisData: myTextField.text ?? "Default")
    }
}
