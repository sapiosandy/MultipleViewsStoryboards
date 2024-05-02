//
//  ViewController.swift
//  MultipleViewsStoryboards
//
//  Created by Sandra Gomez on 4/29/24.
//

import UIKit

class ViewController: UIViewController, MyProtocol {
    
    @IBOutlet var myTextField: UITextField!
    
    var gotDataBack = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func sendBackDataAgain(thisData: String) {
        gotDataBack = thisData
        myTextField.text = gotDataBack
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondVC = segue.destination as? SecondViewController {
            secondVC.receivedData = myTextField.text ?? "Default text"
            secondVC.delegate = self
        }
    }
}

