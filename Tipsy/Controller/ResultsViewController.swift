//  Created by Raefandy Fadila on 5/9/23.

import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var recalculatedPressed: UIButton!
    
    var totalValue : Float?
    var settingsText : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", totalValue!)
        settingsLabel.text = settingsText!

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatedPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
