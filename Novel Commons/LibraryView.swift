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
                    VStack(alignment: .leading) {
                        Image(book.cover!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                width: 150,
                                alignment: .leading
                            )
                            //.scaleEffect(0.5)
                            //.padding(0)
                        Text(book.title)
                            .font(.headline)
                        Text("Pages annotated: " + String(book.pages!.count))
                            .font(.footnote)
                    }
                }
            }
            .navigationBarTitle(Text("Library"))
        }
        //.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
