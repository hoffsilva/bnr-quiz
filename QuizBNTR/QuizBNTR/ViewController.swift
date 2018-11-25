//
//  ViewController.swift
//  QuizBNTR
//
//  Created by Hoff Silva on 16/10/2018.
//  Copyright © 2018 br.hoffsilva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK - UI Properties
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelAnswer: UILabel!
    @IBOutlet weak var labelTempQuestion: UILabel!
    
    
    //MARK - Source Properties
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"
    ]
    
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    
    var currentQuestionIndex = 0

    
    //MARK - UI Methods
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question = questions[currentQuestionIndex]
        labelQuestion.text = question
        labelAnswer.text = "???"
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer = answers[currentQuestionIndex]
        labelAnswer.text = answer
    }
    
    //MARK - Default Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        labelQuestion.text = questions[currentQuestionIndex]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelQuestion.alpha = 0
    }
    
    // MARK - Animations
    func animateLabelTransitions() {
        //Animate the alpha
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.labelTempQuestion.alpha = 0
            self.labelQuestion.alpha = 1
        }) { _ in
            swap(&self.labelTempQuestion, &self.labelQuestion)
        }
    }
}




