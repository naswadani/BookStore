//
//  BookCell.swift
//  BookStore
//
//  Created by naswakhansa on 21/07/25.
//

import Foundation
import UIKit

import UIKit

class BookCell: UITableViewCell {
    private let bookImageView = UIImageView()
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let wishlistButton = UIButton(type: .system)
    
    var toggleAction: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with book: Book) {
        bookImageView.image = UIImage(named: book.imageName) 
        titleLabel.text = book.title
        authorLabel.text = book.author

        let wishlistTitle = book.isWishlisted ? "Remove from Wishlist" : "Add to Wishlist"
        let wishlistColor = book.isWishlisted ? UIColor.red : UIColor.systemBlue
        wishlistButton.setTitle(wishlistTitle, for: .normal)
        wishlistButton.setTitleColor(wishlistColor, for: .normal)
    }

    private func setupViews() {
        bookImageView.contentMode = .scaleAspectFill
        bookImageView.clipsToBounds = true
        bookImageView.layer.cornerRadius = 8
        contentView.addSubview(bookImageView)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        contentView.addSubview(titleLabel)
        
        authorLabel.font = UIFont.systemFont(ofSize: 14)
        authorLabel.textColor = .darkGray
        authorLabel.textAlignment = .center
        contentView.addSubview(authorLabel)
        
        wishlistButton.addTarget(self, action: #selector(wishlistButtonTapped), for: .touchUpInside)
        contentView.addSubview(wishlistButton)
    }

    private func setupLayout() {
        [bookImageView, titleLabel, authorLabel, wishlistButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            bookImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            bookImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bookImageView.widthAnchor.constraint(equalToConstant: 120),
            bookImageView.heightAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            wishlistButton.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            wishlistButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            wishlistButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    @objc private func wishlistButtonTapped() {
        toggleAction?()
    }
}
