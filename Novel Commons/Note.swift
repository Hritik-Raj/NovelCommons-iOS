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
    var page: Page?
}

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
