//
//  NewNoteView.swift
//  Novel Commons
//
//  Created by Sul S. on 12/26/20.
//

import SwiftUI

struct NewNoteView: View {
    var book: Book
    @Binding var isPresented: Bool
    @State var page: String = ""
    @State var title: String = ""
    @State var content: String = ""
    func submitNewNote() {
        book.newNote(book: book, title: title, page: page, content: content)
        isPresented = false
    }
    var body: some View {
        VStack {
            Form {
                Section(header: Text("PROPERTIES")) {
                    TextField("Page number", text: $page)
                        .keyboardType(.numberPad) //still need to check if form value is actually an int
                    TextField("Note title", text: $title)
                }
                Section(header: Text("CONTENT")) {
                    TextEditor(text: $content)
                }
            }
            Button("Submit", action: {
                submitNewNote()
            })
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        Text("NewNoteView")
    }
}
