//
//  LibraryCellTableViewCell.swift
//  BookStore
//
//  Created by Arian Mohajer on 1/20/22.
//

import UIKit

class LibraryCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func updateViews(book: Book){
        titleLabel.text = book.title
        authorLabel.text = book.author
        var ratingString = String(book.rating)
        ratingString.append(" / 5")
        ratingLabel.text = ratingString
    }
}
