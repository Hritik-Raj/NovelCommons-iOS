//
//  BookNotesView.swift
//
//
//  Created by Sul S. on 12/26/20.
//

import SwiftUI

struct BookNotesView: View {
    @State var newNotePresented = false
    @StateObject var book: Book //ensures book.notes updates on form submit
    
    func presentNewNoteView() {
        newNotePresented = true
    }
    var body: some View {
        NavigationView {
            LazyVStack(alignment: .leading) {
                Button("New note", action: { presentNewNoteView() })
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
                    //.frame(minHeight: 800, alignment: .topLeading)
                }
            }
            .navigationTitle(Text("Notes"))
            .frame(minHeight: 550, alignment: .topLeading)
            .padding()
        }
        .sheet(isPresented: $newNotePresented) {
            NewNoteView(book: book, isPresented: self.$newNotePresented)
        }
    }
}
struct BookNotesView_Previews: PreviewProvider {
    static var previews: some View {
        Text("BookNotesView")
    }
}
