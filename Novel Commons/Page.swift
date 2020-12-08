//
//  Page.swift
//  Novel Commons
//
//  Created by Pudding on 11/20/20.
//
import SwiftUI
import CoreLocation

class Page: Identifiable, ObservableObject {
    let id = UUID()
    var num: Int
    var book: Book?
    var notes: [Note]?
    var text: String
    
    init(num: Int, notes: [Note]?, text: String) {
        self.num = num
        self.notes = notes
        self.text = text
    }
}

/*
var page1 = Page(
    id: 1,
    num: 15,
    notes: [Note (
        id: 3,
        num: 17,
        text: "BEST. PAGE. EVER"
    )]
)
var page2 = Page(
    id: 1,
    num: 15,
    notes: [Note(
        id: 1,
        num: 13,
        text: "I love this page"
    )]
)
var page3 = Page(
    id: 1,
    num: 15,
    notes: [Note(
        id: 1,
        num: 13,
        text: "I love this page too"
    )]
)
var pageData = [page1, page2, page3]
*/
