//
//  Note_Detail.swift
//  Novel Commons
//
//  Created by Hritik Raj on 11/20/20.
//

import SwiftUI

struct Note_Detail: View {
    var note: Notes
    var body: some View {
        VStack(alignment: .leading) {
            Text("Note " + String(note.num))
                .font(.title)
            Text(note.text)
                .font(.subheadline)
        }
    }
}


struct Note_Detail_Previews: PreviewProvider {
    static var previews: some View {
        Note_Detail(note: note_Data[0])
    }
}
