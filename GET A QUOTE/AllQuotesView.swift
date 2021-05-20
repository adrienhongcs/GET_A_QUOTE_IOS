//
//  AllQuotesView.swift
//  GET A QUOTE
//
//  Created by Adrien Hong on 5/18/21.
//

import SwiftUI

struct AllQuotesView: View {
    
    @ObservedObject var viewModel = QuoteViewModel()
    
    init() {
        viewModel.fetchAllQuotes()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.allQuotes) { quote in
                    VStack {
                        Text("\""+quote.quote+"\"")
                        Spacer()
                        Text("- "+quote.author)
                            .italic()
                    }
                }
                .onDelete { offsets in
                    let index = offsets[offsets.startIndex]
                    viewModel.deleteQuote(index)
                }
            }
            .navigationBarTitle(Text("ALL QUOTES"))
            .navigationBarItems(trailing: Button("Refresh",action: { viewModel.fetchAllQuotes() }))
            
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}
