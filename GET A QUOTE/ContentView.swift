//
//  ContentView.swift
//  GET A QUOTE
//
//  Created by Adrien Hong on 5/18/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            HeaderView()
            TabView {
                RandomQuoteView()
                    .tabItem {
                        Image(systemName: "shuffle")
                    }
                AllQuotesView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
