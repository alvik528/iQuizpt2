//
//  QuizViewController.swift
//  
//
//  Created by Vikram Thirumalai on 11/12/15.
//
//

import UIKit

struct Question {
    var question: String
    var answers: [String]
    var correctAnswer: String
}

class QuizViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    let subjects = ["Mathematics", "Song Completion", "Rappers"]
    let MathQuiz = [
        Question(question: "2+2 ?", answers: ["4","2","6","8"], correctAnswer: "4"),
        Question(question: "2+3 ?", answers: ["5","1","3","7"], correctAnswer: "5"),
        Question(question: "12 * 3 ?", answers: ["26","32","36","15"], correctAnswer: "36"),
        Question(question: "132 - 13 ?", answers: ["19","108","119","68"], correctAnswer: "119"),
        Question(question: "120 / 3 ?", answers: ["40","360","240","13"], correctAnswer: "40")]
    let SongQuiz = [
        Question(question: "You used to call me...", answers: ["on my cellphone","on my pager","on skype","on faceboko"], correctAnswer: "on my cellphone"),
        Question(question: "we could have had it all...", answers: ["but nah","really?","rollin in the deep","it all"], correctAnswer: "rollin in the deep"),
        Question(question: "poetic justice put it...", answers: ["where u want","in the air","on the ground","in a song"], correctAnswer: "in a song"),
        Question(question: "jumpman jumpman jumpman", answers: ["jumpman","you're up to something","them boys up to something","something"], correctAnswer: "them boys up to something"),
        Question(question: "what she order?", answers: ["fish fillet","what you say","let me say","crambrulee"], correctAnswer: "fish fillet")]
    
    let RapQuiz = [
        Question(question: "Which Philly rapper had beef with Drake?", answers: ["Beanie Sigel","Meek Mill","Freeway","Jay-z"], correctAnswer: "Meek Mill"),
        Question(question: "Which rapper put out To Pimp a Butterfly?", answers: ["J. Cole","Kanye West","Kendrick Lamar","T.I."], correctAnswer: "Kendrick Lamar"),
        Question(question: "Which group came out with the song Straight Outta Compton", answers: ["N.W.A.","Migos","Public Enemy","Ice Cube"], correctAnswer: "N.W.A."),
        Question(question: "Who invented the cooking dance?", answers: ["James Harden","Lil B","Tyler the Creator","Earl Sweatshirt"], correctAnswer: "Lil B")]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationController?.navigationBar.topItem?.title = "Pick a Quiz"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return subjects.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myIdentifier", forIndexPath: indexPath) as! QuizCell
        let image : UIImage = UIImage (named : "quiz.png")!
        cell.quizName.text = subjects[indexPath.row]
        cell.imageView?.image = image
        // Configure the cell...
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! QuizCell
        
        let questionController = segue.destinationViewController as! QuestionViewController
        questionController.currentQuestion = 1
        questionController.numCorrect = 0
        switch cell.quizName.text! {
            case "Mathematics" :
                questionController.questions = MathQuiz
                questionController.navigationItem.title = "Math Quiz"
            case "Song Completion" :
                questionController.questions = SongQuiz
                questionController.navigationItem.title = "Song Quiz"
            case "Rappers" :
                questionController.questions = RapQuiz
                questionController.navigationItem.title = "Rapper Quiz"
            default:
                break
            
        }
    }
    

}
