//
//  Notes.swift
//  Novel Commons
//
//  Created by Hritik Raj on 11/20/20.
//

import SwiftUI
import CoreLocation

struct Note: Identifiable {
    let id = UUID()
    //var num: Int
    var text: String
    //var page: Page?
    var page: Int?
}

var note1 = Note(
    //num: 13,
    text: "I love this page"
)
var note2 = Note(
    //num: 15,
    text: "This page is even better"
)
var note3 = Note (
    //num: 17,
    text: "BEST. PAGE. EVER"
)
var noteData = [note1, note2, note3]
