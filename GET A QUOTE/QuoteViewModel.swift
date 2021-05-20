//
//  QuoteViewModel.swift
//  GET A QUOTE
//
//  Created by Adrien Hong on 5/18/21.
//

import Foundation

//{
//    "_id":"609304357a91810015b91c50",
//    "author":"Adrien Hong",
//    "quote":"Please give me a job...",
//    "__v":0
//
//}

struct Quote: Decodable {
    let _id : String
    let author: String
    let quote: String
}

extension Quote: Identifiable {
    var id: String {
        return _id
    }
}

/**
 View Model in the MVVM design pattern where the model is a REST api service
 */
class QuoteViewModel: ObservableObject {
    
    @Published var allQuotes = [Quote]()
    @Published var randomQuote = [Quote]()
    
    /**
     @route GET api/quotes
     @desc Get a random Quote
     @access Public
     */
    func fetchRandomQuote() {
        guard let url = URL(string: "https://lit-plateau-87240.herokuapp.com/api/quotes/")
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            // check response status and err
            guard let data = data else { return }
            do {
                let results = try JSONDecoder().decode([Quote].self, from: data)
                DispatchQueue.main.async {
                    self.randomQuote = results
                }
            } catch {
                print("Failed to decode: \(error)")
            }
        }.resume()
    }
    
    /**
     @route   GET api/quotes/all
     @desc    Get all Quotes
     @access  Public
     */
    func fetchAllQuotes() {
        guard let url = URL(string: "https://lit-plateau-87240.herokuapp.com/api/quotes/all/")
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else { return }
            do {
                let results = try JSONDecoder().decode([Quote].self, from: data)
                DispatchQueue.main.async {
                    self.allQuotes = results
                }
            } catch {
                print("Failed to decode: \(error)")
            }
        }.resume()
    }
    
    /**
     @route DELETE api/quotes/all/:id
     @desc Delete a Quote
     @access Public
     */
    func deleteQuote(_ index: Int) {
        guard let url = URL(string: "https://lit-plateau-87240.herokuapp.com/api/quotes/all/\(allQuotes[index].id)")
        else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: request) { data, res, err in
            guard err == nil else {
                print("Error: error calling DELETE")
                print(err!)
                return
            }
        }.resume()
        allQuotes.remove(at: index)
    }
    
    /**
     @route POST api/quotes
     @desc Create a quote
     @access Public
     */
    func createQuote(_ quote: String, _ author: String){
        guard let url = URL(string: "https://lit-plateau-87240.herokuapp.com/api/quotes/")
        else {
            return
        }
        
        struct QuoteUpload: Codable {
            let quote: String
            let author: String
        }
        
        let createdQuote = QuoteUpload(quote: quote, author: author)
        
        guard let jsonData = try? JSONEncoder().encode(createdQuote) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling POST")
                print(error!)
                return
            }
        }.resume()
    }
}
