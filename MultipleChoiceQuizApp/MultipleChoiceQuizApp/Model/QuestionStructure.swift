//
//  QuestionStructure.swift
//  MultipleChoiceQuizApp
//
//  Created by IIFLUSER on 12/11/21.
//

import Foundation
import UIKit

struct Question
{
    let text : String
    let options : [String]
    let answer : String
    
    init(q: String, a:[String], correctAnswer: String)
    {
        text = q
        options = a
        answer = correctAnswer
    }
}
