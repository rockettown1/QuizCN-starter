//
//  ViewController.swift
//  QuizCN
//
//  Created by Dan on 27/04/2020.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quiz = [
        ["1 + 1 = 2", "True"],
        ["3 + 3 = 6", "True"],
        ["5 + 5 = 9", "False"]
    ]
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = quiz[questionIndex][0]
    }

    @IBAction func answerSelected(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionIndex][1]
        
        if (userAnswer == actualAnswer){
            print("Woop!")
        } else {
            print("Erm, not quite")
        }
        
        if (questionIndex < quiz.count - 1){
            questionIndex += 1
        } else {
            questionIndex = 0
        }
        
        updateUI()
        
    }
    
    func updateUI() {
        questionText.text = quiz[questionIndex][0]
    }
    
}

