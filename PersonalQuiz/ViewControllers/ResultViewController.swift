//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var difinitionLabel: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        calculateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func calculateResult() {
        let catAnswers = answersChosen.filter { $0.animal == .cat }
        let dogAnswers = answersChosen.filter { $0.animal == .dog }
        let rabbitAnswers = answersChosen.filter { $0.animal == .rabbit }
        let turtlAnswers = answersChosen.filter { $0.animal == .turtle }
        
        if catAnswers.count >= dogAnswers.count,
           catAnswers.count >= rabbitAnswers.count,
           catAnswers.count >= turtlAnswers.count {
            for answer in answersChosen {
                if answer.animal == .cat {
                    resultLabel.text = "Вы - \(String(answer.animal.rawValue))"
                    difinitionLabel.text = answer.animal.definition
                }
                break
            }
        } else if dogAnswers.count >= catAnswers.count,
                  dogAnswers.count >= rabbitAnswers.count,
                  dogAnswers.count >= turtlAnswers.count {
            for answer in answersChosen {
                if answer.animal == .dog {
                    resultLabel.text = "Вы - \(String(answer.animal.rawValue))"
                    difinitionLabel.text = answer.animal.definition
                }
                break
            }
        } else if rabbitAnswers.count >= catAnswers.count,
                  rabbitAnswers.count >= dogAnswers.count,
                  rabbitAnswers.count >= turtlAnswers.count {
            for answer in answersChosen {
                if answer.animal == .rabbit {
                    resultLabel.text = "Вы - \(String(answer.animal.rawValue))"
                    difinitionLabel.text = answer.animal.definition
                }
                break
            }
        } else if turtlAnswers.count >= catAnswers.count,
                  turtlAnswers.count >= dogAnswers.count,
                  turtlAnswers.count >= rabbitAnswers.count {
            for answer in answersChosen {
                if answer.animal == .turtle {
                    resultLabel.text = "Вы - \(String(answer.animal.rawValue))"
                    difinitionLabel.text = answer.animal.definition
                }
                break
            }
        }
    }
}
