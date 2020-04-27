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
        Question(text: "2 + 2 = 4", answer: "True"),
        Question(text: "2 + 3 = 6", answer: "False"),
        Question(text: "5 + 5 = 10", answer: "True")
    ]
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerSelected(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionIndex].answer
        
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
        questionText.text = quiz[questionIndex].text
    }
    
}

