//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = Quizbrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!// True, False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor =  UIColor.green.withAlphaComponent(0.5)
        } else {
            sender.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.progress()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        answerA.setTitle(quizBrain.gettingAnswer(number: 0), for: .normal)
        answerB.setTitle(quizBrain.gettingAnswer(number: 1), for: .normal)
        answerC.setTitle(quizBrain.gettingAnswer(number: 2), for: .normal)
        
        answerA.backgroundColor = UIColor.clear
        answerB.backgroundColor = UIColor.clear
        answerC.backgroundColor = UIColor.clear
        
        
    }
    
    
}

