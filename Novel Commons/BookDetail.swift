//
//  BookDetail.swift
//  Novel Commons
//
//  Created by Pudding on 11/20/20.
//
import SwiftUI

struct BookDetail: View {
    var book: Book
    var body: some View {
        // Needs buttons to edit/delete
        VStack(alignment: .leading) {
            Text(book.title)
                .font(.title)
            Text(book.author)
                .font(.subheadline)
        }
        // Each page should be a card at some point
        // But a list will suffice for now
        VStack() {
            if (book.pages!.count > 0) {
                List(book.pages!) { page in
                    NavigationLink(destination: PageDetail(page: page)) {
                        Text("Page " + String(page.num))
                    }
                }
            }
            else {
                Text("No notes yet.")
            }
        }
        // Needs buttons to "Load AR", export(?), and delete
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: bookData[0])
    }
}
