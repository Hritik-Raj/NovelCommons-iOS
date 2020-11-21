//
//  View_Controller.swift
//  Novel Commons
//
//  Created by Hritik Raj on 11/20/20.
//

import SwiftUI
import Combine

class ViewRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<ViewRouter, Never>()
    var currentView: String = "page_book" {
        didSet {
            objectWillChange.send(self)
        }
    }
    var currentBook: Book = book_Data[0] {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var currentPage: Page = page_Data[0] {
        didSet {
            objectWillChange.send(self)
        }
    }
    var currentNote: Notes = note_Data[0] {
        didSet {
            objectWillChange.send(self)
        }
    }
}

struct View_Controller: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        if viewRouter.currentView == "view_book" {
            Book_Detail(book: viewRouter.currentBook)
        }
        if viewRouter.currentView == "view_page" {
            Page_Detail(page: viewRouter.currentPage)
        }
        if viewRouter.currentView == "view_note" {
            Note_Detail(note: viewRouter.currentNote)
        }
    }
}


struct View_Controller_Previews: PreviewProvider {
    static var previews: some View {
        View_Controller()
    }
}
