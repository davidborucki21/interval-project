//
//  ViewController.swift
//  interval project
//
//  Created by Tiger Coder on 9/21/20.
//  Copyright © 2020 Tiger Coder. All rights reserved.
//

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
    
    var timer = Timer()
    var timer2 = Timer ()
    
    var setsValue : Int!
    var timeEachSet : Int!
    var restTime : Int!
    
    var ogTimeEachSet : Int!
    var ogRestTime : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

