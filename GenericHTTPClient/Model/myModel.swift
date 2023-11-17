//
//  myModel.swift
//  GenericHTTPClient
//
//  Created by Zaid on 17/11/2023.
//

import Foundation

struct BooksComingSoon: Codable {
    let id: Int
    let title: String
    let authors: [AuthorModel]
    let languages: [String]
    let formats: [String: String]
}

//struct FormatModel: Codable {
//    let image: URL
//}

struct AuthorModel: Codable {
    let name: String
}

struct BooksResponse: Codable {
    let results: [BooksComingSoon]
}
