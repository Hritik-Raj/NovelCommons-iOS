//
//  ViewController.swift
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

struct ViewController: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        if viewRouter.currentView == "view_book" {
            BookDetail(book: viewRouter.currentBook)
        }
        if viewRouter.currentView == "view_page" {
            PageDetail(page: viewRouter.currentPage)
        }
        if viewRouter.currentView == "view_note" {
            NoteDetail(note: viewRouter.currentNote)
        }
    }
}


struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}