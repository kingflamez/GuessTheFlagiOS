//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Oluwole Adebiyi on 30/11/2019.
//  Copyright © 2019 Oluwole Adebiyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        title = countries[correctAnswer].uppercased()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let answer = sender.tag
        var title: String
        
        if answer == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
}

