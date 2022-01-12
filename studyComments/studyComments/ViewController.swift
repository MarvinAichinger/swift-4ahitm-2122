//
//  ViewController.swift
//  studyComments
//
//  Created by AHITM01 on 12.01.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addCommentBtn: UIButton!
    @IBOutlet weak var showCommentsBtn: UIButton!
    @IBOutlet weak var textFieldBtn: UITextField!
    
    var model:Model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCommentBtn.isEnabled = false
    }
    
    
    @IBAction func textFieldChange(_ sender: UITextField) {
        if let text = textFieldBtn.text {
            if (text != "" && text != " " && !text.starts(with: " ")) {
                addCommentBtn.isEnabled = true
            }else {
                addCommentBtn.isEnabled = false
            }
        }
    }
    
    @IBAction func addCommentBtnPressed(_ sender: UIButton) {
        
        if let text = textFieldBtn.text {
            
            model.comments.append(text)
            textFieldBtn.text = ""
            addCommentBtn.isEnabled = false
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? CommentController {
            controller.model = self.model
        }
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print(identifier)
        return true
    }
    
}

