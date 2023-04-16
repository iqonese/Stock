//
//  ViewController.swift
//  Stock
//
//  Created by Said Tura Saidazimov on 25.03.2023.
//

import UIKit

class LandingPageVC: UIViewController {
    lazy var search: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Find company or ticker"
        searchBar.searchBarStyle = .minimal
        searchBar.returnKeyType = .search
        searchBar.delegate = self
        searchBar.setImage(UIImage(systemName: "magnifyingglass"), for: .search, state: .normal)
        return searchBar
    }()
    
    private lazy var stockButton: UIButton = {
        var button = UIButton()
        view.addSubview(button)
        button.setTitle("Stocks", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(stocksPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentVerticalAlignment = .bottom
        return button
    }()
    
    private lazy var favoritesButton: UIButton = {
        var button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Favourites", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(favoritesPressed), for: .touchUpInside)
        button.contentVerticalAlignment = .bottom
        return button
    }()
    
    private lazy var table: UITableView = {
        var tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 68
        tableView.register(StockCell.self, forCellReuseIdentifier: "StockCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        return tableView
    }()
    
    @objc func stocksPressed() {
        stockButton.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        stockButton.setTitleColor(.black, for: .normal)
        favoritesButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        favoritesButton.setTitleColor(.gray, for: .normal)
    }
    @objc func favoritesPressed() {
        stockButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        stockButton.setTitleColor(.gray, for: .normal)
        favoritesButton.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        favoritesButton.setTitleColor(.black, for: .normal)
        
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(search)
        stocksPressed()
        // Do any additional setup after loading the view.
        NSLayoutConstraint.activate([
            search.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            search.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            search.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            
            stockButton.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 20),
            stockButton.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            stockButton.heightAnchor.constraint(equalToConstant: 32),
            
            favoritesButton.topAnchor.constraint(equalTo: stockButton.topAnchor),
            favoritesButton.leftAnchor.constraint(equalTo: stockButton.rightAnchor, constant: 20),
            favoritesButton.heightAnchor.constraint(equalTo: stockButton.heightAnchor),
            
            table.topAnchor.constraint(equalTo: stockButton.bottomAnchor, constant: 20),
            table.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            table.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }


}

extension LandingPageVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.setImage(UIImage(systemName: "arrow.left"), for: .search, state: .normal)
        searchBar.showsCancelButton = false
        if searchBar.text == "" {
            searchBar.setImage(UIImage(systemName: "magnifyingglass"), for: .search, state: .normal)
        }
    }
}

extension LandingPageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "StockCell", for: indexPath) as! StockCell
        cell.isUserInteractionEnabled = true
        cell.selectionStyle = .default
        cell.layer.cornerRadius = 16
        cell.changeLabel.text = "abc"
        cell.nameLabel.text = "Yandex"
        cell.priceLabel.text = "KUKU"
        cell.symbolLabel.text = "Hayya"
//        cell.favoriteButton.setImage(UIImage(named: "disabledStar"), for: .normal)
        cell.logoImageView.image = UIImage(named: "YNDX")
        cell.favoriteButton.addTarget(self, action: #selector(favoritesPressed), for: .touchUpInside)
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(named: "cellColor")
        }
        else {
            cell.backgroundColor = .white
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        let destinationVC = StockDetailsVC()
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
