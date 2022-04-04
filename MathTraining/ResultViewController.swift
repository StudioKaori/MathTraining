//
//  ResultViewController.swift
//  MathTraining
//
//  Created by Kaori Persson on 2022-04-04.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result = 0.0
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = "\(round(result))%"
        if result < 50 {
            messageLabel.text = "You probably need more training. Please try again!"
        }else if result < 80 {
            messageLabel.text = "Nice!"
        }else{
            messageLabel.text = "You are great!"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
