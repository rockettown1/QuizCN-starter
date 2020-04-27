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
    
    
    var quizManager = QuizManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerSelected(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizManager.checkAnswer(userAnswer: userAnswer)
        
        if (userGotItRight){
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizManager.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func updateUI() {
        questionText.text = quizManager.getQuestionText()
        trueButton.backgroundColor = UIColor.darkText
        falseButton.backgroundColor = UIColor.darkText
        progressBar.progress = quizManager.getProgress()
    }
    
}

