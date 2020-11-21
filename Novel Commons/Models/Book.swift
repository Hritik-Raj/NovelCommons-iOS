//
//  Book.swift
//  Novel Commons
//
//  Created by Pudding on 11/19/20.
//

import SwiftUI
import CoreLocation

struct Book: Hashable, Identifiable, Codable {
    var id: Int
    var title: String
    var author: String
    var pages: [Page]?
}


 var book1 = Book(
        id: 1,
        title: "Working in Public",
        author: "Nadia Eghbal",
    pages: [Page(id:3, num:19, notes: [Notes (
        id: 3,
     num: 17,
     text: "BEST. PAGE. EVER"
    )])]
    )
var book2 = Book(
        id: 2,
        title: "Comprehension",
        author: "Walter Kintsch",
    pages: [Page(id:1, num:13, notes: [Notes(
        id: 1,
        num: 13,
        text: "I love this page"
    )])]
    )
 var book3 = Book (
        id: 3,
        title: "Surfing Uncertainty",
        author: "Andy Clark",
    pages: [Page(id:1, num:13, notes: [Notes(
        id: 1,
        num: 13,
        text: "I love this page too"
    )]), Page(id:2, num:15, notes:[])]
    )

var book_Data = [book1, book2, book3]

//struct BookDetail: View {
//    var book: Book
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(book.title)
//                .font(.title)
//            Text(book.author)
//                .font(.subheadline)
//        }
//    }
//}
//
//struct BookDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        BookDetail(book: bookData[1])
//    }
//}


