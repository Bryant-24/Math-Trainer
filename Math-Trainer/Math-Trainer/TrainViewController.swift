//
//  TrainViewController.swift
//  Math-Trainer
//
//  Created by Ruslan Galiev on 3/31/23.
//

import UIKit

final class TrainViewController: ViewController {

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

        super.configureButtons(buttonsAnswerCollection + [buttonBack])
    }
}
