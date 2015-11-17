//
//  QuizCell.swift
//  
//
//  Created by Vikram Thirumalai on 11/12/15.
//
//

import UIKit

class QuizCell: UITableViewCell {

    @IBOutlet weak var quizName: UILabel!
    @IBOutlet weak var quizQuestion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
