//
//  Notes.swift
//  Novel Commons
//
//  Created by Hritik Raj on 11/20/20.
//

import SwiftUI
import CoreLocation

struct Note: Identifiable {
    var id: Int
    var num: Int
    var text: String
}
//
//struct Notes_Detail: View {
//    
//    var book: Book
//    var page: Page
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(book.title)
//                .font(.title)
//            Text(book.author)
//                .font(.subheadline)
//        }
//    }
//}
//
//struct Notes_Detail_Previews: PreviewProvider {
//    static var previews: some View {
//        Notes_Detail(book: book_Data[0], page: page_Data[0])
//    }
//}

var note1 = Note(
       id: 1,
       num: 13,
       text: "I love this page"
   )
var note2 = Note(
       id: 2,
       num: 15,
    text: "This page is even better"
    
   )
var note3 = Note (
       id: 3,
    num: 17,
    text: "BEST. PAGE. EVER"
   )

var noteData = [note1, note2, note3]
