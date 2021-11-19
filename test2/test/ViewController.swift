
import UIKit

class ViewController: UIViewController {
    var model = Model()

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonGuess: UIButton!
    @IBOutlet weak var buttonListGuesses: UIButton!
    @IBOutlet weak var reloadButton: UIButton!
    
    
    @IBAction func onclickReload(_ sender: UIButton) {
        print("reload")
        reloadGame()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadGame()
    }
    
    @IBAction func onChangeTextField(_ sender: UITextField) {
        buttonGuess.isEnabled = model.isValid(guess: Int(textField.text!))
    }
    
    @IBAction func onclick(_ sender: UIButton) {
        let guess = Int(textField.text!)!
        model.addGuessedNumber(guess: guess)
    }
    
    func compare(guessedString: String) -> Int! {
        buttonListGuesses.isEnabled = true;
        
        let guess = Int(guessedString)!
        return model.compare(guess: guess)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == "listCurrTries") {
            return true
        }else if(checkNumber()) {
            return true
        }
        return false
    }
    
    func checkNumber() -> Bool {
            
            var compareResult = compare(guessedString: textField.text!)
            
            let text: String?
            
            switch compareResult{
            case -1:
                text = "Your number is too low!"
                label.text = text
                return false
            case 1:
                text = "Your number is too high!"
                label.text = text
                return false
            default:
                text = "Hurray! Thats the number!"
                label.text = text
                return true
            }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as? TableViewController
        resultViewController?.model = model
    }
    
    func reloadGame() {
        model.numberToGuess = Int(arc4random_uniform(100))
        model.attempt = [Int]()
        label.text = "Try to guess the number! :)"
        textField.text = ""
        
        print(model.numberToGuess)
        buttonListGuesses.isEnabled = false;
    }

}

