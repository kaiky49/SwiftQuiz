//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Rafael Nicolau on 10/02/23.
//

import UIKit

class QuizViewController: UIViewController {

  
  
  
  @IBOutlet weak var viTimer: UIView!
  @IBOutlet weak var lbQuestion: UILabel!
  @IBOutlet var btAnswers: [UIButton]!
  
  let quizManager = QuizManager()
  
  override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    viTimer.frame.size.width = view.frame.size.width
    UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear,animations: {
      self.viTimer.frame.size.width = 0
    }) { (success) in
      self.showResults()
    }
    
    getNewQUiz()
  }
                                    //aqui alimwnta os 4 botoes com as respostas
  func getNewQUiz() {
    quizManager.refreshQuiz()
    lbQuestion.text = quizManager.question
    for i in  0..<quizManager.opitions.count {
      let option = quizManager.opitions[i]
      let button = btAnswers[i]
      button.setTitle(option, for: .normal)
    }
  }
  
  func showResults() {
    performSegue(withIdentifier: "resultSegue", sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let resultViewcontroller = segue.destination as! ResultViewController
    resultViewcontroller.totalAnwers = quizManager.totalAnswers
    resultViewcontroller.totalCorrectAnswers = quizManager.totalCorrectAnswers
  }
    
  @IBAction func selectAnswer(_ sender: UIButton) {
    let index = btAnswers.index(of: sender)!          //23:00
    quizManager.validateAnswer(index: index)
    getNewQUiz()
  }
  
   
}


