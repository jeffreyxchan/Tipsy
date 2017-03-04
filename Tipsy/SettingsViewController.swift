//
//  SettingsViewController.swift
//  Tipsy
//
//  Created by Jeffrey Chan on 3/2/17.
//  Copyright © 2017 Jeffrey Chan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipSelect: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let tipSelectIndex = defaults.integer(forKey: "3171")
        tipSelect.selectedSegmentIndex = tipSelectIndex
    }
    
    @IBAction func onChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tipSelect.selectedSegmentIndex, forKey: "3171")
        defaults.synchronize()
    }
}
