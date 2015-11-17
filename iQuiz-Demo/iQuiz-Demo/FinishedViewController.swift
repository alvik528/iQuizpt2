//
//  FinishedViewController.swift
//  
//
//  Created by Vikram Thirumalai on 11/16/15.
//
//

import UIKit

class FinishedViewController: UIViewController {

    @IBOutlet var finishedLabel: UILabel!
    var questions = [Question]()
    var numCorrect = Int()
    override func viewDidLoad() {
        NSLog("You got \(numCorrect) out of \(questions.count)!")
        super.viewDidLoad()
        switch numCorrect {
            case questions.count:
                finishedLabel.text = "You got \(numCorrect) out of \(questions.count)! Congrats!"
            case questions.count - 1:
                finishedLabel.text = "You got \(numCorrect) out of \(questions.count)! Almost!"
            default:
                finishedLabel.text = "You got \(numCorrect) out of \(questions.count)! Aww"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let view = segue.destinationViewController as! QuizViewController
        let button = sender as! UIButton
    }
    

}
