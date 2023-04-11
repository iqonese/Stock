//
//  StocksManager.swift
//  StocksApp
//
//  Created by Said Tura Saidazimov on 15.03.2023.
//  JSON from main page

import Foundation

struct StockManager {
    let finnhubURL = "https://finnhub.io/api/v1/stock/symbol?exchange=US&token=cfl36v9r01qqm9m4911gcfl36v9r01qqm9m49120"
    var cells: [Int] = []
    func performRequest() {
        //1. Create URL
        if let url = URL(string: finnhubURL) {
            //2. Create URL Session
            let session = URLSession(configuration: .default)
            
            //3. Give session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error?.localizedDescription as Any)
                    return
                }
                if let safeData = data {
                    self.parseJSON(stockData: safeData)
                }
            }
            //4. Start the task
            task.resume()
            
        }
    }
    
    func parseJSON(stockData: Data) {
        do{
            let decodedData = try JSONDecoder().decode([Stocks].self, from: stockData)
            
            StockProfileManager(symbol: decodedData[0].symbol).performRequest()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
}




