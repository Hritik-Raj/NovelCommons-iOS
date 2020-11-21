//
//  Page.swift
//  Novel Commons
//
//  Created by Hritik Raj on 11/20/20.
//

import SwiftUI


struct Page: Hashable, Codable, Identifiable {
    var id: Int
    var num: Int
    var notes: [Notes]?
}

//var book1 = Book(
//       id: 1,
//       title: "Working in Public",
//       author: "Nadia Eghbal"
//   )
//var book2 = Book(
//       id: 2,
//       title: "Comprehension",
//       author: "Walter Kintsch",
//       pages: [Page(id:1, num:13, book:book1)]
//   )
//var book3 = Book (
//       id: 3,
//       title: "Surfing Uncertainty",
//       author: "Andy Clark"
//   pages: [Page(id:1, num:13, book:book1), Page(id:2, num:15, book:book1)]
//   )

var page1 = Page(
       id: 1,
       num: 15,
    notes: [Notes (
        id: 3,
     num: 17,
     text: "BEST. PAGE. EVER"
    )]
   )

var page2 = Page(
       id: 1,
       num: 15,
       notes: [Notes(
        id: 1,
        num: 13,
        text: "I love this page"
    )]
   )
var page3 = Page(
       id: 1,
       num: 15,
    notes: [Notes(
        id: 1,
        num: 13,
        text: "I love this page too"
    )]
   )



var page_Data = [page1, page2, page3]
//struct Page_Detail: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct Page_Detail_Previews: PreviewProvider {
//    static var previews: some View {
//        Page_Detail()
//    }
//}
