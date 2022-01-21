//
//  BookController.swift
//  BookStore
//
//  Created by Arian Mohajer on 1/20/22.
//

import Foundation
import UIKit

class BookController {
    // MARK: - Singleton
    static var sharedInstance = BookController()
    
    // MARK: - Source of truth
    var library = [Book]()
    
    // MARK: - CRUD functions
    func createBook(title: String, author: String, rating: Double, synopsis: String, bookImage: UIImage){
        let book = Book(title: title, author: author, rating: rating, synopsis: synopsis, bookImage: bookImage)
        BookController.sharedInstance.library.append(book)
    }
    
    func updateBook(book: Book, title: String, author: String, rating: Double, synopsis: String, bookImage: UIImage){
        book.title = title
        book.author = author
        book.rating = rating
        book.synopsis = synopsis
        book.bookImage = bookImage
    }
    
    func deleteBook(book: Book){
        guard let index = BookController.sharedInstance.library.firstIndex(where: {$0 == book}) else {return}
        BookController.sharedInstance.library.remove(at: index)
    }
}
