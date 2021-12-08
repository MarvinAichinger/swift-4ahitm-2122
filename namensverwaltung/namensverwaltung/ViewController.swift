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
    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onChangeVN(_ sender: UITextField) {
        print("vn changed")
    }
    
    @IBAction func onChangeNN(_ sender: UITextField) {
        print("nn changed")
    }
    
    func updateButtonEnable() {
    }
    
    @IBAction func submitButtonClicked(_ sender: UIButton) {
        print("Button clicked")
        model.add(vname: vornameTextField.text, nname: nachnameTextField.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as? TableViewController
        resultViewController?.model = model
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
}

