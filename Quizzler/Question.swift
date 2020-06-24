//
//  Question.swift
//  Quizzler
//
//  Created by Yvonne Xu on 17/06/20.

import Foundation

class Question{
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
}
