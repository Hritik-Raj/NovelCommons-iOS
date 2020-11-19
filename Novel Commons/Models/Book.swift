//
//  Book.swift
//  Novel Commons
//
//  Created by Pudding on 11/19/20.
//

import SwiftUI
import CoreLocation

struct Book: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var author: String
}

struct BookDetail: View {
    var book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(book.title)
                .font(.title)
            Text(book.author)
                .font(.subheadline)
        }
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: bookData[1])
    }
}
