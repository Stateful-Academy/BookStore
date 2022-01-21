//
//  BookController.swift
//  BookStore
//
//  Created by Arian Mohajer on 1/20/22.
//

import Foundation

class BookController {
    // MARK: - Singleton
    static var sharedInstance = BookController()
    
    // MARK: - Source of truth
    var library = [Book]()
    
    // MARK: - CRUD functions
    func createBook(title: String, author: String, rating: Double, synopsis: String){
        let book = Book(title: title, author: author, rating: rating, synopsis: synopsis)
        BookController.sharedInstance.library.append(book)
    }
    
    func updateBook(book: Book, title: String, author: String, rating: Double, synopsis: String){
        book.title = title
        book.author = author
        book.rating = rating
        book.synopsis = synopsis
    }
    
    func deleteBook(book: Book){
        guard let index = BookController.sharedInstance.library.firstIndex(where: {$0 == book}) else {return}
        BookController.sharedInstance.library.remove(at: index)
    }
}
