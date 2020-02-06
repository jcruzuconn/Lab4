//
//  ListOfQuestions.swift
//  i2020_02_04
//
//  Created by Bradford, Phillip on 2/4/20.
//  Copyright © 2020 Bradford, Phillip. All rights reserved.
//

import Foundation

public class ListOfQuestions {
    
    private var correctAnswers: Int = 0
    private var totalQuestionsAsked: Int = 0
    private var currentQuestionNumber: Int = 0
    
    public let allQs = [
        Question(statement: "Alaska is in South America", isTrue: false),
        Question(statement: "Central America is a continent", isTrue: false),
        Question(statement: "Asia is the largest continent", isTrue: true),
        Question(statement: "Greece borders the Mediterranean sea", isTrue: true)

    ]
             
    public func correctAnswer() -> Void {
        correctAnswers = correctAnswers + 1
        totalQuestionsAsked = totalQuestionsAsked + 1
    }
    
    public func nextQuestionNumber() -> Int {
        
        currentQuestionNumber = currentQuestionNumber + 1
        return currentQuestionNumber % allQs.count
    }

}
