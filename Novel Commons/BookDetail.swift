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
        // Needs buttons to edit/delete
        NavigationView {
            if (book.pages!.count > 0) {
                List(book.pages!) { page in
                    NavigationLink(destination: PageDetail(page: page)) {
                        VStack (alignment: .leading) {
                            Text("Page " + String(page.num))
                                .font(.headline)
                            Text(String(page.notes!.count) + " notes on this page.")
                                .font(.subheadline)
                        }
                    }
                }
            }
            else {
                Text("No pages have been annotated for " + book.title + ", yet.")
            }
        }
        .navigationBarTitle(Text(book.title))
        // Each page should be a card at some point
        // But a list will suffice for now
        // Needs buttons to "Load AR", export(?), and delete
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: bookData[0])
    }
}
