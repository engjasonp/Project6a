
//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Jason Eng on 7/6/15.
//  Copyright (c) 2015 EngJason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreCount: UILabel!
    @IBOutlet weak var result: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        askQuestion()
    }

    func askQuestion() {
        
        countries.shuffle()
        correctAnswer = Int(arc4random_uniform(3))
        title = countries[correctAnswer].uppercaseString
        
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
    }
    @IBAction func buttonTapped(sender: UIButton) {
        var title: String
        
        if (sender.tag == correctAnswer) {
            title = "Correct!"
            ++score
        } else {
            title = "Wrong!"
            --score
        }
        result.hidden = false
        result.text = title
        askQuestion()
        scoreCount.text = "Score: \(score)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

