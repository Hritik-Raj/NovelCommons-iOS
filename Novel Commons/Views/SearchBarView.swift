
//
//  SearchBarView.swift
//  Novel Commons
//
//  Created by Hritik Raj on 11/21/20.
//
import SwiftUI

struct SearchBarView : UIViewRepresentable {

    @Binding var text : String

    class Cordinator : NSObject, UISearchBarDelegate {

        @Binding var text : String

        init(text : Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBarView.Cordinator {
        return Cordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBarView>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBarView>) {
        uiView.text = text
    }
}
