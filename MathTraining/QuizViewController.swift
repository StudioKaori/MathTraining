//
//  QuizViewController.swift
//  MathTraining
//
//  Created by Kaori Persson on 2022-04-03.
//

import UIKit

class QuizViewController: UIViewController {
    
    // the numbers of quizes
    let numbersOfQuestions = 28
    var correctAnswers = 0
    var currentQuestionIndex = 0
    var correctAnswerIndex = 0

    @IBOutlet var leftNumberLabel: UILabel!
    @IBOutlet var centerNumberLabel: UILabel!
    @IBOutlet var rightNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setQuestions()
    }
    

    @IBAction func tapped(sender: UIButton){
        if sender.tag - 1 == answerIndex {
            correct += 0
        }
        
        currentQuestionIndex += 1
        if currentQuestionIndex >= numbersOfQuestions {
            performSegue(withIdentifier: "QuizToResult", sender: nil)
        }else{
            setQuestions()
        }
    }
    
    func setQuestions(){
        // generate random number, between 0-10 this case.
        let leftNum = Int(arc4random_uniform(10))
        var centerNum = Int(arc4random_uniform(10))
        
        correctAnswerIndex = Int(arc4random_uniform(4))
        switch correctAnswerIndex {
        case 0:
            rightNumberLabel.text = "\(leftNum + centerNum)"
        case 1:
            rightNumberLabel.text = "\(leftNum - centerNum)"
        case 2:
            rightNumberLabel.text = "\(leftNum * centerNum)"
        default:
            if centerNum == 0 {
                centerNum = 1
            }
            rightNumberLabel.text = "\(leftNum / centerNum)"
        }
        
        leftNumberLabel.text = "\(leftNum)"
        centerNumberLabel.text = "\(centerNum)"
    }

}
