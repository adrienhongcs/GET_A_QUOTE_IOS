//
//  RandomQuoteView.swift
//  GET A QUOTE
//
//  Created by Adrien Hong on 5/18/21.
//

import SwiftUI

struct RandomQuoteView: View {
    
    @ObservedObject var viewModel = QuoteViewModel()
    
    init() {
        viewModel.fetchRandomQuote()
    }
    
    var body: some View {
        VStack {
            Text("RANDOM QUOTE")
                .font(Font.largeTitle)
                .bold()
            ForEach(viewModel.randomQuote) { quote in
                VStack {
                    ScrollView {
                        VStack {
                            Text("\""+quote.quote+"\"")
                                .font(Font.largeTitle)
                            Text("- "+quote.author)
                                .italic()
                        }
                        .padding()
                        .multilineTextAlignment(.center)
                    }
                    .border(Color.black, width: 4)
                    Button("Get Another Random Quote", action: { viewModel.fetchRandomQuote() })
                        .padding()
                }
                .padding()
            }
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}
