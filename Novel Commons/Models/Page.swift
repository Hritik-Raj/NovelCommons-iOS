//
//  Page.swift
//  Novel Commons
//
//  Created by Pudding on 11/20/20.
//
import SwiftUI
import CoreLocation

struct Page: Identifiable {
    var id: Int
    var num: Int
    var book: Book?
}

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

var pageData = [page1, page2, page3]
