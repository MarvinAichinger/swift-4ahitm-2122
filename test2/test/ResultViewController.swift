
import UIKit

class ResultViewController: UIViewController {

    var model: Model!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Great! Your Tries: \(model.counterOfTrys)"
    }
    
}
