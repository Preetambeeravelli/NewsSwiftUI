//
//  ContentView.swift
//  NewsSwiftUI
//
//  Created by Preetam Beeravelli on 3/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State private var isAlertPresented = false
    
    
    var body: some View {
        
        NavigationView {
            List(networkManager.posts){post in
                NavigationLink(destination: DetailView(url: post.story_url)) {
                    Text(post.story_title ?? "No Title")
                }
            }
            
            .navigationTitle("News")
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        if networkManager.pageNumber == 0 {
                            isAlertPresented.toggle()
                        }
                        else {
                            networkManager.pageNumber -= 1
                        }
                    }, label: {
                        Text("Previous Page")
                    })
                    .padding(.leading, 50)
                }
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        networkManager.pageNumber += 1
                    }, label: {
                        Text("Next Page")
                    })
                    .padding(.trailing, 50)
                }
            }
            
        }.onAppear{
            networkManager.fetchData(pageNumber: 0)
        }
        .onChange(of: networkManager.pageNumber, perform: { newValue in
            networkManager.fetchData(pageNumber: networkManager.pageNumber)
        })
        .alert("Alert", isPresented: $isAlertPresented) {
            
        } message: {
            Text("Reached First Page")
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
