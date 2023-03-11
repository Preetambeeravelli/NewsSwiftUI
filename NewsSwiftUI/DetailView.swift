//
//  DetailView.swift
//  NewsSwiftUI
//
//  Created by Preetam Beeravelli on 3/10/23.
//

import SwiftUI
import WebKit

struct DetailView: View {
    var url: String?
    var body: some View {
      webView(urlString: url)
    }
}

struct webView: UIViewRepresentable{
    let urlString: String?

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let safeURLString = urlString else {return}
        guard let safeURL = URL(string: safeURLString) else {return}
        let request = URLRequest(url: safeURL)
        uiView.load(request)
    }
    
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "www.google.com")
    }
}
