//
//  ViewController.swift
//  Egg Timer
//
//  Created by Julien Shim on 4/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    var timeRemaining: Int = 0
    var timer: Timer!
    
    let eggTimes : [String : Int] = [
        "Soft": 5,
        "Medium": 8,
        "Hard": 12
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        if (timer != nil) {
            timer.invalidate()
        }
        let hardness = sender.currentTitle!
        timeRemaining = eggTimes[hardness]! * 60
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }
    
    @objc func step() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            timer.invalidate()
        }
        print("\(timeRemaining) seconds")
    }
}

