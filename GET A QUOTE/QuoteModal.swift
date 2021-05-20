//
//  QuoteModal.swift
//  GET A QUOTE
//
//  Created by Adrien Hong on 5/19/21.
//

import SwiftUI

struct QuoteModal: View {
    
    @ObservedObject var viewModel = QuoteViewModel()
    
    @Binding var isPresentingQuoteModal: Bool
    
    @State var quote = ""
    @State var author = ""
    
    func addQuote(_ quote: String, _ author: String) {
        if quote == "" || author == "" {
            return
        }
        isPresentingQuoteModal.toggle()
        viewModel.createQuote(quote,author)
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Quote:")
                    TextField("Enter the quote", text: $quote)
                }
                .padding()
                HStack {
                    Text("Author:")
                    TextField("Enter the author", text: $author)
                }
                .padding()
            }
            .padding()
            HStack{
                Button(action: { isPresentingQuoteModal.toggle() }, label: {
                    Text("Cancel")
                        .padding()
                })
                .background(Color.red)
                .border(Color.black, width: 4)
                .padding()
                Spacer()
                Button(action: { addQuote(quote, author) }, label: {
                    Text("Add")
                        .padding()
                })
                .background(Color.green)
                .border(Color.black, width: 4)
                .padding()
            }
            .foregroundColor(.white)
        }
        .padding()
    }
}

