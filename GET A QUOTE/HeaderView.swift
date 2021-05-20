//
//  HeaderView.swift
//  GET A QUOTE
//
//  Created by Adrien Hong on 5/18/21.
//

import SwiftUI

struct HeaderView: View {
    
    @State var isPresentingQuoteModal = false
    
    var body: some View {
        VStack {
            HStack {
                Text("GET A QUOTE!")
                    .padding(.leading)
                Spacer()
                Link("Github", destination: URL(string: "https://github.com/adrienhongcs/GET_A_QUOTE_IOS")!)
                    .padding(.trailing)
                    .accentColor(.black)
            }
            .padding(.horizontal)
            .padding(.top)
            Button(action: { isPresentingQuoteModal.toggle() }, label: {
                Text("Add")
                    .foregroundColor(Color.white)
                    .padding(5)
            })
            .sheet(isPresented: $isPresentingQuoteModal, content: {
                QuoteModal(isPresentingQuoteModal: $isPresentingQuoteModal)
            })
        }
        .padding(.bottom)
        .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
