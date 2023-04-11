//
//  customButton.swift
//  StocksApp
//
//  Created by Said Tura Saidazimov on 20.03.2023.
//

import Foundation
import UIKit

struct CustomButton {
    var button = UIButton()
    func configureButton(name: String)->UIButton {
        button.setTitle(name, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(named: "cellColor")
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }
}


