//
//  TrainViewController.swift
//  Math-Trainer
//
//  Created by Ruslan Galiev on 3/31/23.
//

import UIKit

final class TrainViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    
    // MARK: - Properties
    var sign: String = ""
    var count: Int = 0
    var type: MathTypes = .add {
        didSet {
            switch type {
            case .add:
                sign = "+"
            case .subtract:
                sign = "-"
            case .multiply:
                sign = "*"
            case .devide:
                sign = "/"
            }
        }
    }
    
    private var firstNumber = 0
    private var secondNumber = 0
    
    private var answer: Int {
        switch type {
        case .add:
            return firstNumber + secondNumber
        case .subtract:
            return firstNumber - secondNumber
        case .multiply:
            return firstNumber * secondNumber
        case .devide:
            return firstNumber / secondNumber
        }
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        customizeButtons()
        configureQuestion()
        configureButtons()
    }
    
    // MARK: - IBActions
    @IBAction func leftAction(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }

    @IBAction func rightAction(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    
    // MARK: - Methods
    private func customizeButtons() {
        [leftButton, rightButton, backButton].forEach { $0.addShadow() }
    }
    private func configureButtons() {
        rightButton.layer.backgroundColor = UIColor.systemYellow.cgColor
        leftButton.layer.backgroundColor = UIColor.systemYellow.cgColor

        let isRightButton = Bool.random()
        var randomAnswer: Int
        
        repeat {
            randomAnswer = Int.random(in: (answer - 1)...(answer + 1))
        } while randomAnswer == answer
        
        rightButton.setTitle(isRightButton ? String(answer) : String(randomAnswer), for: .normal)
        leftButton.setTitle(isRightButton ? String(randomAnswer) : String(answer), for: .normal)
    }
    
    private func configureQuestion() {
        (firstNumber, secondNumber) = getTwoRandomNumbers()

        if type == .devide {
            repeat {
                (firstNumber, secondNumber) = getTwoRandomNumbers()
            } while isNotCorrectDivisorOrDividend(divisor: firstNumber, dividend: secondNumber)
        }
        
        let question: String = "\(firstNumber) \(sign) \(secondNumber) = "
        questionLabel.text = question
    }
    
    private func getTwoRandomNumbers() -> (Int, Int) {
        return (Int.random(in: 1...99), Int.random(in: 1...99))
    }
    
    private func isNotCorrectDivisorOrDividend(divisor: Int, dividend: Int) -> Bool {
        return (divisor % dividend != 0) || (divisor == dividend) || dividend == 1
    }
    
    private func check(answer: String, for button: UIButton) {
        let isRightAnswer = Int(answer) == self.answer
        
        button.backgroundColor = isRightAnswer ? .green : .red
        
        if isRightAnswer {
            let isSecondAttempt: Bool = rightButton.backgroundColor == .red || leftButton.backgroundColor == .red
            count += isSecondAttempt ? 0 : 1
            rightButton.isEnabled = false
            leftButton.isEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.rightButton.isEnabled = true
                self?.leftButton.isEnabled = true
                self?.configureQuestion()
                self?.configureButtons()
            }
            countLabel.text = "Count: \(count)"
        }
    }
}
