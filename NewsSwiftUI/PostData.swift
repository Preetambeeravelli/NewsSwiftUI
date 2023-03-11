//
//  PostData.swift
//  NewsSwiftUI
//
//  Created by Preetam Beeravelli on 3/10/23.
//

import Foundation

struct Result: Decodable{
    let hits: [Post]
}


struct Post: Decodable, Identifiable{
    var id: String{
        return objectID
    }
    let objectID: String
    let story_id: Int?
    let story_title: String?
    let story_url: String?
}
