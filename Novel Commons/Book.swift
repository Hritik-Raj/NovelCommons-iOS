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
    var cover: String? = "default-cover"
}

 var book1 = Book(
    id: 1,
    title: "Working in Public",
    author: "Nadia Eghbal",
    pages: [Page(id:3, num:19, notes:
            [Note (id: 3, num: 17, text: "BEST. PAGE. EVER")]
            )],
    cover: "working-in-public"
)
var book2 = Book(
    id: 2,
    title: "Comprehension",
    author: "Walter Kintsch",
    pages: [Page(id:1, num:13, notes:
            [Note(id: 1, num: 13, text: "I love this page")]
            )],
    cover: "comprehension"
)
 var book3 = Book (
    id: 3,
    title: "Surfing Uncertainty",
    author: "Andy Clark",
    pages: [Page(id:1, num:13, notes:
            [Note(id: 1, num: 13, text: "I love this page too")]
            ), Page(id:2, num:15, notes:[])],
    cover: "surfing-uncertainty"
)

var bookData = [book1, book2, book3]
