//
//  ViewController.swift
//  Whack-A-Mole
//
//  Created by Joel Joseph on 9/6/22.
//
import UIKit

class ViewController: UIViewController {
    
    var timer:Timer?
    var timer2:Timer?
    var btn = UIButton()
    
    var screenWidth = 0
    var screenHeight = 0
    var score = 0
    
    var lblHorizontal = UILabel()
    var lblVertical = UILabel()
    

    var label = UILabel()
    var start = UILabel()
    var done = UILabel()
    var gameOver = false
    
    //declares random x,y positions
    var xposition = Int()//.random(in: 0..<350)
    var yposition = Int()//.random(in: 0..<844)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //label
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 50, y: 50)
        label.textAlignment = .center
        label.text = "Score: \(score)"
        self.view.addSubview(label)
        
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        
        //green background
        lblHorizontal.frame = CGRect(x: 0, y: 100, width: 500, height: 900)
        lblHorizontal.backgroundColor = UIColor.green
        view.addSubview(lblHorizontal)
        
        
        //button
        btn.frame = CGRect(x: 30, y: 100, width: 80, height: 90 )
        btn.backgroundColor = UIColor.blue
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        start = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        start.center = CGPoint(x: 200, y: 400)
        start.textAlignment = .center
        start.text = "CLICK TO START"
        self.view.addSubview(start)
        start.isHidden = false
        done = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        done.center = CGPoint(x: 200, y: 400)
        done.textAlignment = .center
        done.text = "GAME OVER"
        self.view.addSubview(done)
        done.isHidden = true
        view.addSubview(btn)
        self.view = view
        
        
        //timer 1 for 2 sec interval
        timer = Timer.scheduledTimer(
            timeInterval: 2.0, target: self, selector: #selector(timerFunction), userInfo: nil,
            repeats: true)
        
        //timer 2 for 5 sec interval
        timer2 = Timer.scheduledTimer(
            timeInterval: 5.0, target: self, selector: #selector(timerFunctionHide), userInfo: nil,
            repeats: true)
        
        
        
        
    }
    
    @objc func buttonTapped(_ sender: UIButton!) {
        btn.isHidden = true
        score += 1
        label.text = "Score: \(score)"
        print("button clicked")
        //creates a random location
        xposition = Int.random(in: 0..<300)
        yposition = Int.random(in: 0..<650)
        btn.frame = CGRect(x: xposition, y: yposition, width: 80, height: 90 )
        print(xposition)
        print(yposition)
        start.isHidden = true
        timer2?.invalidate()
        timer2 = nil
        timer2 = Timer.scheduledTimer(
        timeInterval: 5.0, target: self, selector: #selector(timerFunctionHide), userInfo: nil,
            repeats: true)
        
        
    }
    @objc func timerFunction(_ sender: UIButton!) {
        print("Timer fired!!")
        if(gameOver == false){
            btn.isHidden = false
        }
        
        
    }
    @objc func timerFunctionHide(_ sender: UIButton!) {
        print("Timer Hide fired!!")
        btn.isHidden = true
        score -= 1
        label.text = "Score: \(score)"
        if(score == 0){
            gameOver = true
            done.isHidden = false
        }
        
        
        
    }
}
