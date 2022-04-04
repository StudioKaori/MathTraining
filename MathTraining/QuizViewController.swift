//
//  QuizViewController.swift
//  MathTraining
//
//  Created by Kaori Persson on 2022-04-03.
//

import UIKit

class QuizViewController: UIViewController {
    
    // the numbers of quizes
    let numbersOfQuestions = 10
    var correctAnswers = 0
    var currentQuestionIndex = 0
    var correctAnswerIndex = 0

    @IBOutlet var leftNumberLabel: UILabel!
    @IBOutlet var centerNumberLabel: UILabel!
    @IBOutlet var rightNumberLabel: UILabel!
    @IBOutlet var currentResultLabel:UILabel!
    @IBOutlet var currentNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setQuestions()
    }
    
    // prepare will be executed when the view is navigated to the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // via segue, you can access to the next view controller: that is segue.destination
        // if the next view controller is type of ResultViewController (? is for checking if it's nil or not)
        if let resultVC = segue.destination as? ResultViewController {
            resultVC.result = Double(correctAnswers) / Double(numbersOfQuestions) * 100.0
        }
    }
    

    @IBAction func tapped(sender: UIButton){
        currentQuestionIndex += 1
        currentNumberLabel.text = "\(currentQuestionIndex) / \(numbersOfQuestions)"
        
        if sender.tag - 1 == correctAnswerIndex {
            correctAnswers += 1
            currentResultLabel.text = "Correct! \(correctAnswers) / \(currentQuestionIndex)"
        }else{
            currentResultLabel.text = "Wrong! \(correctAnswers) / \(currentQuestionIndex)"
        }
        
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
