//
//  ListOfQuestions.swift
//  i2020_02_04
//
//  Created by Bradford, Phillip on 2/4/20.
//  Copyright © 2020 Bradford, Phillip. All rights reserved.
//

import Foundation

public class ListOfQuestions {
    
    public var correctAnswers: Int = 0
    public var totalQuestionsAsked: Int = 0
    private var currentQuestionNumber: Int = 0
    public let allHints = ["Alaska is a state", "Central America is not a continent", "Asia contains China and India", "Greece is in Europe",
    "Delaware is the 2nd smallest state", "Egypt is in Africa"]
    
    public let allQs = [
        Question(statement: "Alaska is in South America", isTrue: false),
        Question(statement: "Central America is a continent", isTrue: false),
        Question(statement: "Asia is the largest continent", isTrue: true),
        Question(statement: "Greece borders the Mediterranean sea", isTrue: true),
        Question(statement: "Rhode Island is the smallest state in the US", isTrue: true ),
        Question(statement: "Egypt is in Europe", isTrue: false )

    ]
             
    public func correctAnswer() -> Int {
        correctAnswers = correctAnswers + 1
        totalQuestionsAsked = totalQuestionsAsked + 1
        return correctAnswers
    }
    
    public func incorrectAnswer() -> Int {
        totalQuestionsAsked = totalQuestionsAsked + 1
        return correctAnswers
    }
    
    public func nextQuestionNumber() -> Int {
        currentQuestionNumber = currentQuestionNumber + 1
        return currentQuestionNumber % allQs.count
    }
    public func currentQuestionNumbers() -> Int {
           return currentQuestionNumber
}
    
    public func provideHint() -> String {
        return allHints[currentQuestionNumber]
    }
}
