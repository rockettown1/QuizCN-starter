//
//  QuizManager.swift
//  QuizCN
//
//  Created by Dan on 27/04/2020.
//  Copyright © 2020 Dan. All rights reserved.
//

import Foundation

struct QuizManager {
    let quiz = [
        Question(text: "The Code Nation Master course is 12 weeks long.", answer: "True"),
        Question(text: "The JavaScript programming language is related to the Java programming language.", answer: "False"),
        Question(text: "The Golang programming language has a gopher as a mascot.", answer: "True")
    ]
    
    var questionIndex = 0
    var score = 0
    
    func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionIndex].answer {
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionIndex].text
    }
    
    func getProgress() -> Float {
        let progress = Float(questionIndex + 1) / Float(quiz.count)
        return progress
    }
    
    mutating func nextQuestion() -> Bool {
        if (questionIndex < quiz.count - 1){
            questionIndex += 1
            return true
        } else {
            questionIndex = 0
            
            return false
        }
    }
    mutating func calculateScore(num: Int){
        score += num
        
        if num == 0 {
            score = 0
        }
    }
    
    
    
   
}
