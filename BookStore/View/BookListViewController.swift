//
//  BookListViewController.swift
//  BookStore
//
//  Created by naswakhansa on 21/07/25.
//

import Foundation
import UIKit

class BookListViewController: UIViewController, UITableViewDataSource {
    let tableView = UITableView()
    let viewModel = BookListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Book List"
        view.backgroundColor = .white
        view.addSubview(tableView)

        
        tableView.dataSource = self
        tableView.register(BookCell.self, forCellReuseIdentifier: "BookCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    func tableView(_  tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = viewModel.books[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "BookCell", for: indexPath
        ) as! BookCell
        
        cell.configure(with: book)
        cell.toggleAction = { [weak self] in
            self?.viewModel.toggleWishlist(at: indexPath.row)
            self?.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        return cell
    }
}
