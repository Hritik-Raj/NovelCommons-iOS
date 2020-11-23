//
//  Page_Detail.swift
//  Novel Commons
//
//  Created by Hritik Raj on 11/20/20.
//
import SwiftUI

struct Page_Detail: View {
    var page: Page

    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Page " + String(page.num))
//                .font(.title)
//        }
//        NavigationView {
//            List(note_Data) { note in
//                NavigationLink(destination: Note_Detail(book: book)) {
//                    Text(note.title)
//                }
//            }
//            .navigationBarTitle(Text("Notes"))
//        }
        
        VStack() {
            if (page.notes!.count > 0) {
                List(page.notes!) { note in
                    NavigationLink(destination: Note_Detail(note: note)) {
                        Text("Note " + String(note.num))
                    }
                    .navigationBarTitle(Text("Notes"))
                }
            }
            else {
                Text("No notes yet.")
            }
        }
    }
}

struct Page_Detail_Previews: PreviewProvider {
    static var previews: some View {
        Page_Detail(page: Page(id: 0, num: 0))
    }
}
