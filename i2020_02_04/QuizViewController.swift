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
    let Qs =  ListOfQuestions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        questionBox.text = Qs.allQs[0].statement
        
        
    }
    @IBAction func nextSelected(_ sender: Any) {
        let n = Qs.nextQuestionNumber()
        
        questionBox.text = Qs.allQs[n].statement
    }
    
    

}

