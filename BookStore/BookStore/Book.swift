//
//  Book.swift
//  BookStore
//
//  Created by Arian Mohajer on 1/20/22.
//

import Foundation

class Book {
    // MARK: - Properties
    var title: String
    var author: String
    var lastUpdated: Date
    var rating: Double
    var synopsis: String
    
    // MARK: - Memberwise Initializer
    init(title: String, author: String, lastUpdated: Date = Date(), rating: Double, synopsis: String) {
        self.title = title
        self.author = author
        self.lastUpdated = lastUpdated
        self.rating = rating
        self.synopsis = synopsis
    }
}

extension Book: Equatable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.title == rhs.title &&
        lhs.author == rhs.author &&
        lhs.rating == rhs.rating &&
        lhs.synopsis == rhs.synopsis
    }
}
