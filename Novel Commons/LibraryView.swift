//
//  LibraryView.swift
//  Novel Commons
//
//  Created by Pudding on 11/19/20.
//

import SwiftUI

struct LibraryView: View {
    @State private var searchTerm : String = ""
    var body: some View {
        NavigationView {
            List(book_Data) { book in
                NavigationLink(destination: Book_Detail(book: book)) {
                    Text(book.title)
                }
            }
            .navigationBarTitle(Text("Books"))
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
