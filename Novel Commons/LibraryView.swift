//
//  LibraryView.swift
//  Novel Commons
//
//  Created by Pudding on 11/19/20.
//
import SwiftUI

struct LibraryView: View {
    var body: some View {
        VStack {
            HStack {
                Text("LIBRARY")
                    .font(.title)
                Button(action: {
                    ScanView()
                }) {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
            }
            
            ForEach(bookData) { book in
                    VStack(alignment: .leading) {
                        HStack {
                            Image(book.cover!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(
                                    width: 150,
                                    alignment: .leading
                                )
                            VStack {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .font(.headline)
                                Button(action: {
                                    // What to perform
                                }) {
                                    Text("NOTES")
                                        .fontWeight(.bold)
                                            .font(.title)
                                            .padding()
                                            .background(Color.blue)
                                            .cornerRadius(15)
                                            .foregroundColor(.white)
                                            .padding(10)
                                    // How the button looks like
                                }
                                
                                Button(action: {
                                    // What to perform
                                }) {
                                    Text("ISLAND")
                                        .fontWeight(.bold)
                                            .font(.title)
                                            .padding()
                                            .background(Color.blue)
                                            .cornerRadius(15)
                                            .foregroundColor(.white)
                                            .padding(10)
                                    // How the button looks like
                                }
                            }
                    }
                }
            }
            // need button to create book
    }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
