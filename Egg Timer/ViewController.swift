//
//  ViewController.swift
//  Egg Timer
//
//  Created by Julien Shim on 4/17/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var totalTime: Int = 0
    var secondsPassed: Int = 0
    
    var audioPlayer: AVAudioPlayer!
    var timer: Timer!
    
    let eggTimes : [String : Int] = [
        "Soft": 300,
        "Medium": 480,
        "Hard": 720
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
        totalTime = eggTimes[hardness]!

        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }
    
    @objc func step() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = percentageProgress
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            playAlarm()
        }
    }
    
    func playAlarm() {
        let soundURL = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.play()
    }
}

