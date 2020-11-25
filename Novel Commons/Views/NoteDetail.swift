//
//  NoteDetail.swift
//  Novel Commons
//
//  Created by Hritik Raj on 11/20/20.
//
import SwiftUI

struct NoteDetail: View {
    var note: Note
    var body: some View {
        VStack(alignment: .leading) {
            Text("Note " + String(note.num))
                .font(.title)
            Text(note.text)
                .font(.subheadline)
        }
    }
}


struct NoteDetail_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetail(note: noteData[0])
    }
}
