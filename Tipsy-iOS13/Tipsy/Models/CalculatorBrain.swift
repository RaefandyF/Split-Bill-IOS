//  Created by Raefandy Fadila on 5/10/23.

import Foundation

struct CalculatorBrain {
    
    var tipSelected: Float?
    var splitAmount: Float?
    var setting : String?
    var tipsy : Tipsy?
    
    mutating func setTipValue(_ tipTitle : String) -> Array<Bool> {
        if  tipTitle == "0%" {
            tipSelected = 0
            // zero,ten,twenty
            return [true, false, false]
        } else if tipTitle == "10%" {
            tipSelected = 0.1
            // zero,ten,twenty
            return [false, true, false]
        } else if tipTitle == "20%" {
            tipSelected = 0.2
            // zero,ten,twenty
            return [false, false, true]
        }
        return [false, false, false]
    }
    
    mutating func calculateTip(splitNumber : Float, billTotal : Float) {
        splitAmount = ((billTotal * (tipSelected ?? 0)) + billTotal) / splitNumber
        
        setting = "Split Beetween \(String(format: "%.0f", splitNumber)) people with \(String(format: "%.0f", (tipSelected ?? 0) * 100))% tip"
        
        tipsy = Tipsy(bill: billTotal, tip: tipSelected ?? 0, person: Int(splitNumber), setting: setting!, splitAmount: splitAmount!)
    }
    
    func getSplitValue() -> Float {
        return tipsy?.splitAmount ?? 0
    }
    
    func getSettingText() -> String {
        return tipsy?.setting ?? "no setting"
    }
    
    
    
    
}
