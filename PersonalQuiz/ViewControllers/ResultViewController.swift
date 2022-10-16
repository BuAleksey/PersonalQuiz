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
        
        updateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func updateResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answersChosen.map { $0.animal }
        
        for animal in animals {
            if let animalsTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalsTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        let sortedFrequency = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let result = sortedFrequency.first?.key else { return }
        
        updateScreen(with: result)
    }

    private func updateScreen(with animal: Animal) {
        resultLabel.text = "Вы - \(String(animal.rawValue))"
        difinitionLabel.text = animal.definition
    }
       
}
