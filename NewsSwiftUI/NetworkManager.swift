//
//  NetworkManager.swift
//  NewsSwiftUI
//
//  Created by Preetam Beeravelli on 3/10/23.
//

import Foundation


class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]()
    @Published var pageNumber = 0
    
    func fetchData(pageNumber: Int){
        guard pageNumber < 30 else {return}
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search_by_date?page=\(pageNumber)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data else {return}
            do{
                let decodedData = try JSONDecoder().decode(Result.self, from: data)
                DispatchQueue.main.async {
                    self.posts = decodedData.hits
                }
            }
            catch{
                print("Error Decoding data")
            }
            }
            
        task.resume()
    }
}
