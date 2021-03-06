//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        let userChoice = sender.currentTitle!
        storyBrain.nextQuestion(choice: userChoice)
        
        //If you want to have slow transition for personal animation
        //Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        storyLabel.text = storyBrain.gettingTitle()
        //choice1Button.setTitle(storyBrain.gettingChoice1(), for: .normal)
        choice1Button.setTitle(storyBrain.gettingChoice1(), for: <#T##UIControl.State#>)
        choice2Button.setTitle(storyBrain.gettingChoice2(), for: .normal)
    }
    
    
}

