//
//  LibraryTableViewController.swift
//  BookStore
//
//  Created by Arian Mohajer on 1/20/22.
//

import UIKit

class LibraryTableViewController: UITableViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return BookController.sharedInstance.library.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? LibraryCellTableViewCell else {return UITableViewCell()}

        // Configure the cell...
        cell.updateViews(book: BookController.sharedInstance.library[indexPath.row])
        return cell
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            BookController.sharedInstance.library.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Identity
        if segue.identifier == "toDetailVC" {
            //Index
            if let index = tableView.indexPathForSelectedRow{
                //Destination
                if let destination = segue.destination as? BookDetailViewController {
                    //Object to send
                    let book = BookController.sharedInstance.library[index.row]
                    //Object that will receive
                    destination.book = book
                }
            }
        }
    }
}
