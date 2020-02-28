//
//  ViewController.swift
//  i2020_02_04
//
//  Created by Bradford, Phillip on 2/4/20.
//  Copyright © 2020 Bradford, Phillip. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionBox: UITextField!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!


    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    
    let Qs =  Questions()
    
    
    public var selection: Bool?
    public var score: Int = 0
    public var h: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Qs.getQuestions()
        
        
        
        questionBox.text = Qs.allQs[0].statement
        
        
    }
    @IBAction func nextSelected(_ sender: Any) {
        let c = Qs.currentQuestionNumbers()
        if selection == Qs.allQs[c].isTrue{
            score = Qs.correctAnswer()
            scoreLabel.text = "Score: \(score)"
        } else{
            score = Qs.incorrectAnswer()
            print(score)
        }
        
        let n = Qs.nextQuestionNumber()
        
        questionBox.text = Qs.allQs[n].statement
        hintLabel.text = ""

    }
    
    @IBAction func hintSelected(_ sender: Any) {
        h = Qs.provideHint()
        hintLabel.text = h
    }
    
    @IBAction func trueSelected(_ sender: Any) {
        print("True is selected.")
        selection = true

        
    }
    
    @IBAction func falseSelected(_ sender: Any) {
        print("False is selected")
        selection = false
    }
    
    
}

