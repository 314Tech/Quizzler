//
//  Question.swift
//  Quizzler
//
//  Created by Nabyl Bennouri on 5/2/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionAsked: String
    let questionAnswer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionAsked = text
        questionAnswer = correctAnswer
    }
}
