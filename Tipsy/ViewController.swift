//
//  ViewController.swift
//  Tipsy
//
//  Created by Jeffrey Chan on 3/2/17.
//  Copyright © 2017 Jeffrey Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipChoice: UISegmentedControl!
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var twoWay: UILabel!
    @IBOutlet weak var threeWay: UILabel!
    @IBOutlet weak var fourWay: UILabel!
    @IBOutlet weak var fiveWay: UILabel!
    @IBOutlet weak var price: UITextField!
    
    override func viewDidLoad() {
        price.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let initialTipChoiceIndex = defaults.integer(forKey: "3171")
        tipChoice.selectedSegmentIndex = initialTipChoiceIndex
        calculate(Any.self)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func onTipChoiceChange(_ sender: Any) {
        calculate(Any.self)
    }
    
    @IBAction func calculate(_ sender: Any) {
        let percentages = [0.1, 0.15, 0.18, 0.2]
        let bill = Double(price.text!) ?? 0
        let tipValue = bill * percentages[tipChoice.selectedSegmentIndex]
        let total = bill + tipValue
        
        tip.text! = String(format: "$%.2f", tipValue)
        twoWay.text! = String(format: "$%.2f", total/2)
        threeWay.text! = String(format: "$%.2f", total/3)
        fourWay.text! = String(format: "$%.2f", total/4)
        fiveWay.text! = String(format: "$%.2f", total/5)
    }
}

