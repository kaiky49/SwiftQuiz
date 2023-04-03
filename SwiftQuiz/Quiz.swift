//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Kaiky kevin on 10/02/23.
//

import Foundation

class Quiz {
  
  let question: String
  let opitions: [String]
  private let correctedAnswer: String
  

  init(question: String, opitions: [String], correctedAnswer: String ) {
    self.question = question
    self.opitions = opitions
    self.correctedAnswer = correctedAnswer
  }
  
  func validateOpition(_ index: Int) -> Bool {
    let answer = opitions[index]
    return answer == correctedAnswer
  }
  
  
  deinit {
    print("Liberio o Quiz da memoria")
  }
  
}
