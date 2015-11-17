//
//  AnswerViewController.swift
//  
//
//  Created by Vikram Thirumalai on 11/12/15.
//
//

import UIKit

class AnswerViewController: UIViewController {

    var correctAnswer = String()
    var selectedAnswer = String()
    var currentQ = Int()
    var questions = [Question]()
    var numCorrect = Int()
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var yourAnswer: UILabel!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.enabled = false;
        if(selectedAnswer == correctAnswer) {
            self.numCorrect++
            self.correctLabel.text = "Correct"
            self.yourAnswer.text = "You chose \(selectedAnswer) which is correct!"
            let nav = self.navigationController as! NavigationController
        } else {
            self.correctLabel.text = "Wrong!"
            self.yourAnswer.text = "You chose \(selectedAnswer), Right answer was \(correctAnswer)"
        }
        if(currentQ == questions.count) {
            doneButton.enabled = true
            nextButton.enabled = false;
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
        if(sender?.titleLabel?!.text! == "Next") {
            let view = segue.destinationViewController as! QuestionViewController
            let button = sender as! UIButton
            view.numCorrect = self.numCorrect
            view.questions = self.questions
            view.currentQuestion = currentQ + 1
        }
        else if(sender?.titleLabel?!.text! == "Done") {
            NSLog("HIHIHIHI")
            let view = segue.destinationViewController as! FinishedViewController
            let button = sender as! UIButton
            view.numCorrect = self.numCorrect
            view.questions = self.questions
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
