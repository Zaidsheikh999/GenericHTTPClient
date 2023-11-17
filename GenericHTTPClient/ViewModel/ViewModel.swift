//
//  ViewModel.swift
//  GenericHTTPClient
//
//  Created by Zaid on 17/11/2023.
//

import Foundation


class ViewModel: ObservableObject{
    
    @Published var booksComingSoon: [BooksComingSoon] = []
    
    var isData: Bool = false
    
    
    //    func httpRequest() async{
    //        guard let apiUrl = URL(string: "https://gutendex.com/books/") else {
    //            fatalError("Invalid API URL")
    //        }
    //
    //        let resource = Resource(url: apiUrl, modelType: BooksResponse.self)
    //
    //        do {
    //            let response: BooksResponse = try await HTTPClient.shared.load(resource)
    //            // Handle the response here
    //            self.booksComingSoon = response.results
    //            print(booksComingSoon)
    //        } catch {
    //            // Handle errors here
    //            if let networkError = error as? NetworkError {
    //                print("Network Error: \(networkError.localizedDescription)")
    //            } else {
    //                print("Unexpected Error: \(error.localizedDescription)")
    //            }
    //        }
    //    }
    func httpRequest() async {
        guard let apiUrl = URL(string: "https://gutendex.com/books/") else {
            fatalError("Invalid API URL")
        }
        
        let resource = Resource(url: apiUrl, modelType: BooksResponse.self)
        
        do {
            let response: BooksResponse = try await HTTPClient.shared.load(resource)
            
            DispatchQueue.main.async {
                self.booksComingSoon = response.results
                self.isData = true
                print(self.booksComingSoon)
            }
        } catch {
            // Handle errors here
            if let networkError = error as? NetworkError {
                print("Network Error: \(networkError.localizedDescription)")
            } else {
                print("Unexpected Error: \(error.localizedDescription)")
            }
        }
    }
    
}
