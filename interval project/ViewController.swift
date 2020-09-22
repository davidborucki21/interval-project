//
//  ViewController.swift
//  interval project
//
//  Created by Tiger Coder on 9/21/20.
//  Copyright © 2020 Tiger Coder. All rights reserved.
//new comment

import UIKit

class ViewController: UIViewController {
    
    //text box outlets
    @IBOutlet weak var setsBox: UITextField!
    @IBOutlet weak var timeForEachSetBox: UITextField!
    @IBOutlet weak var restTimeBox: UITextField!
    
   //red number outlets
    
    @IBOutlet weak var setsNumber: UILabel!
    @IBOutlet weak var timeForEachSetNumber: UILabel!
    @IBOutlet weak var restTimeNumber: UILabel!
    
    var timer = Timer() //first timer
    var timer2 = Timer () //rest timer
   
    //these are basically the int version of what the user inputs
    var setsValue : Int!
    var timeEachSet : Int!
    var restTime : Int!
    
    var ogTimeEachSet : Int! //original time for each set value so that i can change the number back to the original number once the first timer expires
    var ogRestTime : Int! //same thing but for the rest timer
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func buttonClicked(_ sender: Any) {
        setsNumber.text = setsBox.text
        timeForEachSetNumber.text = timeForEachSetBox.text
        restTimeNumber.text = restTimeBox.text
        
        timeEachSet = Int(timeForEachSetNumber.text!)
        restTime = Int(restTimeNumber.text!)
        setsValue = Int(setsNumber.text!)
        
        ogTimeEachSet = Int(timeForEachSetNumber.text!)
        ogRestTime = Int(restTimeNumber.text!)
        
        if (setsValue >= 0) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeForEachSetCountDownMethod), userInfo: nil, repeats: true)
        
        }
    }
    
    //these are the two timers
    
    @objc func timeForEachSetCountDownMethod(){
     timeEachSet -= 1
    timeForEachSetNumber.text = "\(timeEachSet!)"
        
    if (timeEachSet < 0) {
            timer.invalidate()
            timeForEachSetNumber.text = String(ogTimeEachSet!)
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(restTimeCountDownMethod), userInfo: nil, repeats: true)
        }
        
    }
    
    
    @objc func restTimeCountDownMethod(){
     restTime -= 1
    restTimeNumber.text = "\(restTime!)"
        
    if (restTime < 0) {
            timer2.invalidate()
            restTimeNumber.text = String(ogRestTime!)
        setsValue -= 1
        setsNumber.text = "\(setsValue!)"
        
    
        }
        

    }
        
   
    
}

