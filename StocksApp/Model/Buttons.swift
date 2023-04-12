//
//  Buttons.swift
//  StocksApp
//
//  Created by Said Tura Saidazimov on 12.04.2023.
//
import UIKit
import Foundation

@objcMembers
class Buttons {
    @objc static func stockButtonPressed(stock : UIButton, favorites: UIButton) {
        stock.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        stock.setTitleColor(.black, for: .normal)
        favorites.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        favorites.setTitleColor(.gray, for: .normal)
    }
    @objc static func favoriteButtonPressed(stock: UIButton, favorites: UIButton){
        stock.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        stock.setTitleColor(.gray, for: .normal)
        favorites.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        favorites.setTitleColor(.black, for: .normal)
    }
}
