//
//  ViewController.swift
//  Math-Trainer
//
//  Created by Ruslan Galiev on 3/31/23.
//

import UIKit

enum MathTypes: Int {
    case add, subtract, multiply, devide
}

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var buttonsCollection: [UIButton]!
    @IBOutlet var addCountLabel: UILabel!
    @IBOutlet var subtractCountLabel: UILabel!
    @IBOutlet var multiplyCountLabel: UILabel!
    @IBOutlet var devideCountLabel: UILabel!
    
    // MARK: - Properties
    private var selectedType: MathTypes = .add
    private var addCount: Int = 0
    private var subtractCount: Int = 0
    private var multiplyCount: Int = 0
    private var devideCount: Int = 0

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeButtons()
    }

    // MARK: - Actions
    @IBAction func buttonsAction(_ sender: UIButton) {
        selectedType = MathTypes(rawValue: sender.tag) ?? .add
        performSegue(withIdentifier: "goToNext", sender: sender)
    }
    
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? TrainViewController {
            let rightAnswersCount = Int(sourceViewController.count)
            switch selectedType {
            case .add:
                addCount += rightAnswersCount
                addCountLabel.text = String(addCount)
            case .subtract:
                subtractCount += rightAnswersCount
                subtractCountLabel.text = String(subtractCount)
            case .multiply:
                multiplyCount += rightAnswersCount
                multiplyCountLabel.text = String(multiplyCount)
            case .devide:
                devideCount += rightAnswersCount
                devideCountLabel.text = String(devideCount)
            }
        }
    }

    // MARK: - Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? TrainViewController {
            viewController.type = selectedType
        }
    }

    private func customizeButtons() {
        buttonsCollection.forEach { $0.addShadow() }
    }
}
