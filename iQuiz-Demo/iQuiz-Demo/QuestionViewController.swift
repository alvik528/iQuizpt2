//
//  QuestionViewController.swift
//  
//
//  Created by Vikram Thirumalai on 11/12/15.
//
//

import UIKit

class QuestionViewController: UIViewController {

    var questions = [Question]()
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    var currentQuestion = Int()
    var numCorrect = Int()
    @IBOutlet weak var QuestionTitle: UILabel!
    @IBOutlet weak var questionName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionTitle.text = ("Question \(currentQuestion)")
        questionName.text = questions[currentQuestion - 1].question
        button1.setTitle(self.questions[currentQuestion - 1].answers[0], forState: UIControlState.Normal)
        button2.setTitle(self.questions[currentQuestion - 1].answers[1], forState: UIControlState.Normal)
        button3.setTitle(self.questions[currentQuestion - 1].answers[2], forState: UIControlState.Normal)
        button4.setTitle(self.questions[currentQuestion - 1].answers[3], forState: UIControlState.Normal)
        
        for button in self.view.subviews {
            if button.isKindOfClass(UIButton) {
                let b = button as! UIButton
                b.addTarget(self, action: "moveToAnswer:", forControlEvents: UIControlEvents.TouchUpInside)
                //b.hidden = false
                //b.setTitle(self.questions[currentQuestion].answers[index], forState: UIControlState.Normal)
            }
        }// Do any additional setup after loading the view.
        
        
    }
    

    func moveToAnswer(sender : UIButton) {
        self.performSegueWithIdentifier("goToAnswer", sender: sender)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let view = segue.destinationViewController as! AnswerViewController
        let button = sender as! UIButton
        view.currentQ = currentQuestion
        view.selectedAnswer = (button.titleLabel?.text)!
        view.questions = self.questions
        view.numCorrect = numCorrect
        view.correctAnswer = self.questions[currentQuestion - 1].correctAnswer
    }
    

}
