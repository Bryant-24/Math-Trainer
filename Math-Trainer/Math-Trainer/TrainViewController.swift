//
//  TrainViewController.swift
//  Math-Trainer
//
//  Created by Ruslan Galiev on 3/31/23.
//

import UIKit

final class TrainViewController: UIViewController {

    // MARK: - Properties
    var type: MathTypes = .add {
        didSet {
            print(type)
        }
    }
}
