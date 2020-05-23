//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft":180, "Medium":240,"Hard":420]
    var timer = Timer()
    var totalTime : Float = 0
    var secondPassed : Float = 0
    var player: AVAudioPlayer?
    
    
    @IBOutlet weak var processTitle: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        processTitle.text = "Cooking..."
        
        let hardness = sender.currentTitle!
        totalTime = Float(eggTimes[hardness]!)
        secondPassed = 0
        progressBar.progress = 0.0
        
        /*var secondsRemaining = eggTimes[hardness]!
         Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
         if secondsRemaining > 0 {
         print ("\(secondsRemaining) seconds")
         secondsRemaining -= 1
         } else {
         Timer.invalidate()
         }
         
         
         }*/ // First solution
        
        // Second solution
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    @objc func updateCounter(){
        if totalTime > secondPassed {
            
            secondPassed += 1
            progressBar.progress = secondPassed / totalTime
            
        } else  {
            timer.invalidate()
            processTitle.text = "DONE!"
            playSound()
        }
    }
}
