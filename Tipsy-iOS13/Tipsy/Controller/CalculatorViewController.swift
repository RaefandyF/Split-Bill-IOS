//  Created by Raefandy Fadila on 5/9/23.

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        let tipTitle = sender.currentTitle!
        zeroPctButton.isSelected = calculatorBrain.setTipValue(tipTitle)[0]
        tenPctButton.isSelected = calculatorBrain.setTipValue(tipTitle)[1]
        twentyPctButton.isSelected = calculatorBrain.setTipValue(tipTitle)[2]
        
        billTextField.endEditing(true)
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
    }
    
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        
        calculatorBrain.calculateTip(splitNumber: Float(splitNumberLabel.text ?? "0") ?? 0, billTotal: Float(billTextField.text ?? "no text field") ?? 0)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalValue = calculatorBrain.getSplitValue()
            destinationVC.settingsText = calculatorBrain.getSettingText()
            
        }
    }
    
    
    
    


}

