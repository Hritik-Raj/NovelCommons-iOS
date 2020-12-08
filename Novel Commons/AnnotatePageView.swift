//
//  AnnotatePageView.swift
//  
//
//  Created by Pudding on 12/6/20.
//

import SwiftUI

struct AnnotatePageView: View {
    var image: Image = Image("working-in-public")
    var body: some View {
        VStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
        }
    }
}

struct AnnotatePageView_Previews: PreviewProvider {
    static var previews: some View {
        AnnotatePageView()
    }
}
