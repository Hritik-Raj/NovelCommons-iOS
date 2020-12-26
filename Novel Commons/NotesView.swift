//
//  NotesView.swift
//  
//
//  Created by Pudding on 12/23/20.
//

import SwiftUI

struct NotesView: View {
    var bookData: [Book]
    func createNote() {
        print("yo")
    }
    var body: some View {
        NavigationView {
            LazyVStack(alignment: .leading) {
                Button("New note", action: { createNote() }) //real func later
                ForEach(bookData) { book in
                    Section(header: Text(book.title).font(.title2)) {
                        ForEach(book.notes) { note in
                            NavigationLink(destination: NoteDetail(note: note)) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.white)
                                        .shadow(radius: 1)
                                    HStack {
                                        Text(String(note.page!)) //need to catch
                                        Text(note.text)
                                    }
                                }
                            }
                            .frame(minHeight: 50)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    //.frame(minHeight: 800, alignment: .topLeading)
                }
            }
            .navigationTitle(Text("Notes"))
            .frame(minHeight: 550, alignment: .topLeading)
            .padding()
        }
    }
}
struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(bookData: bookData)
    }
}
