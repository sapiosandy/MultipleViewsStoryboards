//
//  SecondViewController.swift
//  MultipleViewsStoryboards
//
//  Created by Sandra Gomez on 4/29/24.
//

import UIKit

protocol MyProtocol {
    func sendBackDataAgain(thisData: String)
}

class SecondViewController: UIViewController, MySecondProtocol {
    
    @IBOutlet var myTextField: UITextField!
    var receivedData = ""
    var gotData = ""
    var delegate: MyProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if gotData == "" {
            myTextField.text = receivedData
        } else {
            myTextField.text = gotData
        }
    }
    func sendBackData(thisData: String) {
        self.gotData = thisData
        myTextField.text = gotData
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.sendBackDataAgain(thisData: myTextField.text ?? "Default")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let thirdVC = segue.destination as? ThirdViewController {
            thirdVC.receivedData = myTextField.text ?? "Default text"
            thirdVC.delegate = self
        }
    }
}
