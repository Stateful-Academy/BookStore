//
//  File.swift
//  BookStore
//
//  Created by Arian Mohajer on 1/20/22.
//

import Foundation

class Book {
    // MARK: - Properties
    var name: String
    var title: String
    var rating: Int
    
    // MARK: - Memberwise Initializer
    init(name: String, title: String, rating: Int) {
        self.name = name
        self.title = title
        self.rating = rating
    }
    
}
