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
    @IBOutlet weak var score: UILabel!
    
    
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
            quizManager.calculateScore(num: 1)
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        let keepGoing = quizManager.nextQuestion()
        if (!keepGoing){
            let alert = UIAlertController(title: "Awesome", message: "You've scored \(quizManager.score) correct", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.quizManager.calculateScore(num: 0)
                self.updateUI()
            })
            
            alert.addAction(restartAction)

            present(alert, animated: true, completion: nil)
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func updateUI() {
        questionText.text = quizManager.getQuestionText()
        trueButton.backgroundColor = UIColor.darkText
        falseButton.backgroundColor = UIColor.darkText
        progressBar.progress = quizManager.getProgress()
        score.text = "Score: \(quizManager.score)"
    }
    
}

