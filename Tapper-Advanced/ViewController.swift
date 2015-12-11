//
//  ViewController.swift
//  Tapper-Advanced
//
//  Created by Shi Nam on 2015-12-10.
//  Copyright © 2015 Shi Nam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timerCount = 30
    var timer = NSTimer()
    var tapCount = 0
    
    @IBOutlet weak var tapperLabel: UIImageView!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var playButtonLabel: UIButton!
    @IBOutlet weak var tapButtonLabel: UIButton!
    @IBOutlet weak var timeCounter: UILabel!
    @IBOutlet weak var tapCounter: UILabel!
    @IBOutlet weak var restartButtonLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func onPlayButtonPressed(sender: UIButton) {
        
        timerCount = 30
        tapCount = 0

        
        tapperLabel.hidden = true
        displayLabel.hidden = true
        playButtonLabel.hidden = true
        
        tapButtonLabel.hidden = false
        timeCounter.hidden = false
        tapCounter.hidden = false
        
        if timerCount > 0
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
        }
        
        
        
    }
    func Counting()
    {
        if timerCount <= 0
        {
            timer.invalidate()
            tapButtonLabel.hidden = true
            restartButtonLabel.hidden = false
            
        }
        else
        {
            timerCount--
            timeCounter.text = "\(timerCount) Sec"
        }
    }
    
    @IBAction func onTapButtonPressed(sender: UIButton) {
    
        if timerCount > 0
        {
            tapCount++
            tapCounter.text = "\(tapCount) Taps"

           
        }
        else
        {   timer.invalidate()
            tapButtonLabel.hidden = true
            restartButtonLabel.hidden = false
            
        }
    }
    
    @IBAction func onRestartButtonPressed(sender: UIButton) {
        
        tapperLabel.hidden = false
        displayLabel.hidden = false
        playButtonLabel.hidden = false
        
        tapButtonLabel.hidden = true
        timeCounter.hidden = true
        tapCounter.hidden = true
        restartButtonLabel.hidden = true
        
    }

}

