//
//  StockCell.swift
//  Stock
//
//  Created by Said Tura Saidazimov on 30.03.2023.
//

import UIKit

class StockCell: UITableViewCell {
    
    lazy var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        addSubview(imageView)
        return imageView
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        addSubview(label)
        return label
    }()
    
    lazy var change: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "myGreen")
        label.font = .systemFont(ofSize: 12, weight: .medium)
        addSubview(label)
        return label
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        addSubview(label)
        return label
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(named: "disabledStar"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        return button;
    }()
    
    lazy var symbol: UILabel =  {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layer.cornerRadius = 16
        
        NSLayoutConstraint.activate([
            logo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            logo.centerYAnchor.constraint(equalTo: centerYAnchor),
            logo.heightAnchor.constraint(equalToConstant: 52),
            logo.widthAnchor.constraint(equalTo: logo.heightAnchor),
            
            symbol.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            symbol.leftAnchor.constraint(equalTo: logo.rightAnchor, constant: 12),
            symbol.heightAnchor.constraint(equalToConstant: 24),
            
            name.topAnchor.constraint(equalTo: symbol.bottomAnchor),
            name.leftAnchor.constraint(equalTo: logo.rightAnchor, constant: 12),
            
            price.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            price.rightAnchor.constraint(equalTo: rightAnchor, constant: -17),
            price.heightAnchor.constraint(equalToConstant: 24),
            
            change.topAnchor.constraint(equalTo: price.bottomAnchor),
            change.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            
            favoriteButton.leftAnchor.constraint(equalTo: symbol.rightAnchor, constant: 6),
            favoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            favoriteButton.heightAnchor.constraint(equalToConstant: 16)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
