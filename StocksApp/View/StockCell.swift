//
//  StockCell.swift
//  Stock
//
//  Created by Said Tura Saidazimov on 30.03.2023.
//

import UIKit

class StockCell: UITableViewCell {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        
        return label
    }()
    
    lazy var changeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "myGreen")
        label.font = .systemFont(ofSize: 12, weight: .medium)
        
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        
        return label
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "disabledStar"), for: .normal)
//        button.addTarget(self, action: #selector(favoritesPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var symbolLabel: UILabel =  {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    @objc func favoritesPressed() {
        print("Hi")
        if favoriteButton.currentImage == UIImage(named: "selectedStar") {
            favoriteButton.setImage(UIImage(named: "disabledStar"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "selectedStar"), for: .normal)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layer.cornerRadius = 16
        
        addSubview(symbolLabel)
        addSubview(priceLabel)
        addSubview(changeLabel)
        addSubview(nameLabel)
        addSubview(logoImageView)
        contentView.addSubview(favoriteButton)
        
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 52),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),
            
            symbolLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            symbolLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: 12),
            symbolLabel.heightAnchor.constraint(equalToConstant: 24),
            
            nameLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: 12),
            
            priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -17),
            priceLabel.heightAnchor.constraint(equalToConstant: 24),
            
            changeLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            changeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            
            favoriteButton.leftAnchor.constraint(equalTo: symbolLabel.rightAnchor, constant: 6),
            favoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            favoriteButton.heightAnchor.constraint(equalToConstant: 16)
        ])
        favoriteButton.addTarget(self, action: #selector(favoritesPressed), for: .touchUpInside)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
