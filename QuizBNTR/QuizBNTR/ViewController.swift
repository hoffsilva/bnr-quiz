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
    
    //MARK - Constraints
    @IBOutlet weak var labelQuestionCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelTempQuestionCenterXConstraint: NSLayoutConstraint!
    
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
        //springAnimation()
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer = answers[currentQuestionIndex]
        labelAnswer.text = answer
    }
    
    //MARK - Default Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        labelQuestion.text = questions[currentQuestionIndex]
        updateOffScreenLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelQuestion.alpha = 0
    }
    
    // MARK - Animations - alpha
    func animateLabelTransitions() {
        
        //Force outstanding layout changess to occur.
        view.layoutIfNeeded()
        
        //Animate the alpha
        //and the center X constraints
        let screenWidth = view.frame.width
        self.labelQuestionCenterXConstraint.constant = 0
        self.labelTempQuestionCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.labelTempQuestion.alpha = 0
            self.labelQuestion.alpha = 1
            self.view.layoutIfNeeded()
        }) { _ in
            swap(&self.labelTempQuestion, &self.labelQuestion)
            swap(&self.labelQuestionCenterXConstraint, &self.labelTempQuestionCenterXConstraint)
            self.updateOffScreenLabel()
        }
    }
    // Bronze challenge
    func springAnimation() {
        //Force outstanding layout changess to occur.
        view.layoutIfNeeded()
        
        //Animate the alpha
        //and the center X constraints
        let screenWidth = view.frame.width
        self.labelQuestionCenterXConstraint.constant = 0
        self.labelTempQuestionCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 32, options: .curveLinear, animations: {
            self.labelTempQuestion.alpha = 0
            self.labelQuestion.alpha = 1
            self.view.layoutIfNeeded()
        }) { _ in
            swap(&self.labelTempQuestion, &self.labelQuestion)
            swap(&self.labelQuestionCenterXConstraint, &self.labelTempQuestionCenterXConstraint)
            self.updateOffScreenLabel()
        }
    }
    
    // Silver challenge
    
    
    // MARK - Animations with constraints
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        labelQuestionCenterXConstraint.constant = -screenWidth
    }
}




