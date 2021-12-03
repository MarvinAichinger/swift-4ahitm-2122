//
//  ViewController.swift
//  namensverwaltung
//
//  Created by AHITM01 on 03.12.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var vornameTextField: UITextField!
    @IBOutlet weak var nachnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onChangeVN(_ sender: UITextField) {
        print("vn changed")
    }
    
    @IBAction func onChangeNN(_ sender: UITextField) {
    }
    
    func updateButtonEnable() {
        print("nn changed")
    }
    
    @IBAction func submitButtonClicked(_ sender: UIButton) {
        print("Button clicked")
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
}

