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

    // MARK: - Properties
    private var selectedType: MathTypes = .add

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }

    // MARK: - Actions
    @IBAction func buttonsAction(_ sender: UIButton) {
        selectedType = MathTypes(rawValue: sender.tag) ?? .add
        performSegue(withIdentifier: "goToNext", sender: sender)
    }
    
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) { }

    // MARK: - Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? TrainViewController {
            viewController.type = selectedType
        }
    }

    private func configureButtons() {
        buttonsCollection.forEach { $0.addShadow() }
    }
}
