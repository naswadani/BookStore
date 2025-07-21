//
//  BookListViewModel.swift
//  BookStore
//
//  Created by naswakhansa on 21/07/25.
//

import Foundation


class BookListViewModel {
    private(set) var books: [Book] = [
        Book(
            title: "Atomic Habits",
            author: "James Clear",
            imageName: "atomic_habits",
            isWishlisted: false
        ),
        Book(
            title: "Deep Work",
            author: "Cal Newport",
            imageName: "deep_work",
            isWishlisted: false
        ),
        Book(
            title: "The Pragmatic Programmer",
            author: "Andrew Hunt & David Thomas",
            imageName: "pragmatic_programmer",
            isWishlisted: false
        ),
        Book(
            title: "Clean Code",
            author: "Robert C. Martin",
            imageName: "clean_code",
            isWishlisted: false
        )
    ]
    
    func toggleWishlist(at index: Int) {
        books[index].isWishlisted.toggle()
    }
}
