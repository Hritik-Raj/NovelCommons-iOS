//
//  AnnotatePageView.swift
//  
//
//  Created by Hritik Raj on 12/6/20.
//

import SwiftUI

struct AnnotatePageView: View {
    var returnImage: Image
    
    var body: some View {
        VStack {
                returnImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)

        }
    }
    
}

//struct AnnotatePageView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnnotatePageView(image: )
//    }
//}
