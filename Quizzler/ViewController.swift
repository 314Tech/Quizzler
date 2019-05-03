//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    var userAnswer: Bool = false
    var currentQuestionIndex: Int = 0
    var score: Int = 0
    var questionBank = QuestionBank()
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if (sender.tag == 1) {
            userAnswer = true
        } else {
            userAnswer = false
        }
        checkAnswer()
        nextQuestion()
    }
    
    
    func updateUI() {
        questionLabel.text = questionBank.list[currentQuestionIndex].questionAsked
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(currentQuestionIndex+1)/\(questionBank.list.count)"
        progressBar.frame.size.width = (view.frame.size.width/13)*CGFloat(currentQuestionIndex+1)
    }
    

    func nextQuestion() {
        currentQuestionIndex += 1
        if (currentQuestionIndex >= questionBank.list.count) {
            let alert = UIAlertController(title: "Amesome!", message: "You have completed the test", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: {action in self.startOver()}))
            self.present(alert, animated: true)
        } else {
          updateUI()
        }

    }
    
    
    func checkAnswer() {
        if (userAnswer == questionBank.list[currentQuestionIndex].questionAnswer) {
            score += 1
            ProgressHUD.showSuccess("Correct!")
        } else {
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
       score = 0
       currentQuestionIndex = 0
       updateUI()
    }
    

    
}
