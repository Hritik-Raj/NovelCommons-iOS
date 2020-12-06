//
//  BookDetail.swift
//  Novel Commons
//
//  Created by Pudding on 11/20/20.
//
import SwiftUI

struct BookDetail: View {
    @StateObject var book: Book
    var body: some View {
        // Needs buttons to edit/delete
        VStack {
            Text(book.title)
                .font(.title)
            //NavigationLink(destination: CameraView()) { Text("New page") }
            Button("New page", action: book.newPage)
        }
        if (book.pages!.count > 0) {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(book.pages!) { page in
                        NavigationLink(destination: PageDetail(page: page)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.white)
                                    .frame(width: 300, height: 400)
                                    .shadow(radius: 5)
                                VStack (alignment: .leading) {
                                    Text("Page " + String(page.num))
                                        .font(.headline)
                                    Text(String(page.notes!.count) + " notes on this page.")
                                        .font(.subheadline)
                                }
                            }
                            .frame(width: 375, height: 450)
                            .padding(EdgeInsets(top: 50, leading: 0, bottom: 50, trailing: 0))
                        }
                    }
                }
            }
        }
        else {
            Text("No pages have been annotated for " + book.title + ", yet.")
        }
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: bookData[0])
    }
}
