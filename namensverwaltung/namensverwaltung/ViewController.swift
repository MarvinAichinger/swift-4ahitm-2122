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
        submitButton.isEnabled = false
    }
    
    @IBAction func onChangeVN(_ sender: UITextField) {
        print("vn changed")
        changeSubmitButtonEnable()
    }
    
    @IBAction func onChangeNN(_ sender: UITextField) {
        print("nn changed")
        changeSubmitButtonEnable()
    }
    
    func changeSubmitButtonEnable() {
        if (vornameTextField.text == nil || vornameTextField.text == "" || nachnameTextField.text == nil || nachnameTextField.text == "") {
            submitButton.isEnabled = false
        }else {
            submitButton.isEnabled = true
        }
    }
    
    @IBAction func submitButtonClicked(_ sender: UIButton) {
        print("Button clicked")
        model.add(vname: vornameTextField.text, nname: nachnameTextField.text)
        vornameTextField.text = ""
        nachnameTextField.text = ""
        changeSubmitButtonEnable()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as? TableViewController
        resultViewController?.model = model
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
}

