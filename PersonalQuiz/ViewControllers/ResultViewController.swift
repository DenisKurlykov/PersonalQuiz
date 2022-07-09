//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать массив с ответами на экран с результатами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соответствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var descriptionAnimalLabel: UILabel!
    
    var answers: [Answer]!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let animalLable = getAnymalLabel()
        setAnimal(with: animalLable)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }

    
//    deinit {
//        print("ResultViewController has been deallocated")
//    }
    
    private func getAnymalLabel() -> Animal? {
        return Dictionary(grouping: answers, by: { $0.animal })
            .sorted(by: {$0.value.count > $1.value.count})
            .first?.key
    }
    
        private func setAnimal(with animal: Animal?) {
            resultAnimalLabel.text = "Вы - \(animal?.rawValue ?? "🐶" )!"
            descriptionAnimalLabel.text = animal?.definition ?? ""
        }
}

