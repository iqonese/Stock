//
//  ViewController.swift
//  Stock
//
//  Created by Said Tura Saidazimov on 25.03.2023.
//

import UIKit

class LandingPageVC: UIViewController {
    var a = StockManager()
    lazy var search: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Find company or ticker"
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        view.addSubview(searchBar)
        searchBar.setImage(UIImage(systemName: "magnifyingglass"), for: .search, state: .normal)
        return searchBar
    }()
    
    lazy var stock: UIButton = {
        var button = UIButton()
        view.addSubview(button)
        button.setTitle("Stocks", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(stocksPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentVerticalAlignment = .bottom
        return button
    }()
    
    lazy var favorites: UIButton = {
        var button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Favourites", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(favoritesPressed), for: .touchUpInside)
        button.contentVerticalAlignment = .bottom
        return button
    }()
    
    lazy var table: UITableView = {
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
        stock.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        stock.setTitleColor(.black, for: .normal)
        favorites.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        favorites.setTitleColor(.gray, for: .normal)
    }
    @objc func favoritesPressed() {
        stock.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        stock.setTitleColor(.gray, for: .normal)
        favorites.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        favorites.setTitleColor(.black, for: .normal)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        stocksPressed()
        // Do any additional setup after loading the view.
        NSLayoutConstraint.activate([
            search.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            search.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            search.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            
            stock.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 20),
            stock.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 20),
            stock.heightAnchor.constraint(equalToConstant: 32),
            
            favorites.topAnchor.constraint(equalTo: stock.topAnchor),
            favorites.leftAnchor.constraint(equalTo: stock.rightAnchor, constant: 20),
            favorites.heightAnchor.constraint(equalTo: stock.heightAnchor),
            
            table.topAnchor.constraint(equalTo: stock.bottomAnchor, constant: 20),
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
        cell.layer.cornerRadius = 16
        cell.change.text = "abc"
        cell.name.text = "Yandex"
        cell.price.text = "KUKU"
        cell.symbol.text = "Hayya"
        cell.favoriteButton.setImage(UIImage(named: "disabledStar"), for: .normal)
        cell.logo.image = UIImage(named: "YNDX")
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
