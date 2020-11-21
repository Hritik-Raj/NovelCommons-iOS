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
