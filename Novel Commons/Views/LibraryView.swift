//
//  LibraryView.swift
//  Novel Commons
//
//  Created by Pudding on 11/19/20.
//
import SwiftUI

struct LibraryView: View {
    var body: some View {
        NavigationView {
            List(bookData) { book in
                NavigationLink(destination: BookDetail(book: book)) {
                    Text(book.title)
                }
            }
            .navigationBarTitle(Text("Books"))
            // need button to create book
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
