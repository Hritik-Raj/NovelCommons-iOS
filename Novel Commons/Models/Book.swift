//
//  Book.swift
//  Novel Commons
//
//  Created by Pudding on 11/19/20.
//

import SwiftUI
import CoreLocation

struct Book: Identifiable {
    var id: Int
    var title: String
    var author: String
    var pages: [Page]?
}

var book1 = Book(
    id: 1,
    title: "Working in Public",
    author: "Nadia Eghbal",
    pages: []
)
var book2 = Book(
    id: 2,
    title: "Comprehension",
    author: "Walter Kintsch",
    pages: [Page(id: 1, num: 13, book: book1)]
)
var book3 = Book(
    id: 3,
    title: "Surfing Uncertainty",
    author: "Andy Clark",
    pages: [Page(id: 1, num: 13, book: book1)]
)
var bookData = [book1, book2, book3]
