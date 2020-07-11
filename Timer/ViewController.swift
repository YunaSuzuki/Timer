//
//  ViewController.swift
//  Timer
//
//  Created by 鈴木裕奈 on 2020/06/21.
//  Copyright © 2020 Yuna Suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var setTextField: UITextField!
    @IBOutlet weak var intervalTextField: UITextField!
    @IBOutlet weak var secondsTextField: UITextField!
    @IBOutlet weak var readyTextField: UITextField!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startinvalidButton: UIButton!
    
    
    var secondsTimer :Float = 0
    var timer :Timer!
    var ready :String!
    var seconds :String!
    var interval :String!
    var set :String!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startinvalidButton.layer.cornerRadius = 5.0
        
        ready = readyTextField.text!
        seconds = secondsTextField.text!
        interval = intervalTextField.text!
        set = setTextField.text!
        
    }
    
    @objc func workingTimer(_ timer : Timer){
        self.secondsTimer += 0.1
        self.timerLabel.text = String(format: "%.0f", secondsTimer)
    }
    
    
    //push start button
    @IBAction func startInvalidButton(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {_ in self.workingTimer(self.timer) })
            
            //change the text of start button.
            self.startinvalidButton.setTitle("PAUSE", for: .normal)
            
        } else {
            //タイマーが動いている場合
            if timer.isValid {
                //a case that timer is already runnning.
                self.startinvalidButton.setTitle("START", for: .normal)
                self.timer.invalidate()
            } else {
                //タイマーが一時停止てしているあ場合
                //timerを新しく作り直す
                self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: {_ in self.workingTimer(self.timer) })
                self.startinvalidButton.setTitle("PAUSE", for: .normal)
            }
        }
        
        
    }


}

