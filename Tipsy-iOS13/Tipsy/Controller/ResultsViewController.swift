//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Nguyen Truong Duy Khang on 6/7/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var finalBill: String?
    var details: String?

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = finalBill
        detailsLabel.text = details
        
        
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
