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
    var rating: Int
    
    // MARK: - Memberwise Initializer
    init(title: String, author: String, rating: Int) {
        self.title = title
        self.author = author
        self.rating = rating
    }
}
