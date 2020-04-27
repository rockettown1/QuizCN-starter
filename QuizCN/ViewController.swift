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
        "1 + 1 = 2",
        "3 + 3 = 6",
        "5 + 5 = 10"
    ]
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = quiz[questionIndex]
    }

    @IBAction func answerSelected(_ sender: UIButton) {
        questionIndex += 1
        updateUI()
        
    }
    
    func updateUI() {
        questionText.text = quiz[questionIndex]
    }
    
}

