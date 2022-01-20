//
//  BookController.swift
//  BookStore
//
//  Created by Arian Mohajer on 1/20/22.
//

import Foundation

class BookController {
    static var sharedInstance = BookController()
    var library = [Book]()
}
