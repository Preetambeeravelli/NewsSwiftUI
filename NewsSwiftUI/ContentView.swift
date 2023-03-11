//
//  ContentView.swift
//  NewsSwiftUI
//
//  Created by Preetam Beeravelli on 3/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView {
            List(networkManager.posts){post in
                NavigationLink(destination: DetailView(url: post.story_url)) {
                    Text(post.story_title)
                }
            }

            .navigationTitle("News")
        }.onAppear{
            networkManager.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
