//
//  TrainViewController.swift
//  Math-Trainer
//
//  Created by Ruslan Galiev on 3/31/23.
//

import UIKit

final class TrainViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var buttonBack: UIButton!
    @IBOutlet var buttonsAnswerCollection: [UIButton]!

    // MARK: - Properties
    var type: MathTypes = .add {
        didSet {
            print(type)
        }
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons(buttonsAnswerCollection)
        configureButtons([buttonBack])
    }

    // MARK: - Methods
    private func configureButtons(_ buttons: [UIButton]) {
        // Add shadow
        buttons.forEach { button in
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowOpacity = 0.4
            button.layer.shadowRadius = 3.0
        }
    }
}
