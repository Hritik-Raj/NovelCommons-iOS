//
//  ScanView.swift
//
//
//  Created by Pudding on 12/6/20.
//
import SwiftUI

struct ScanView: View {
    
    @State private var recognizedText = "Tap button to start scanning"
    
    var body: some View {
        NavigationView {
                   VStack {
//                       ScrollView {
//                           ZStack {
//                               RoundedRectangle(cornerRadius: 20, style: .continuous)
//                                   .fill(Color.gray.opacity(0.2))
//
//                               Text(recognizedText)
//                                   .padding()
//                           }
//                           .padding()
//                       }
                       
                       Spacer()
                       
                       HStack {
                           Spacer()
                           
//                        NavigationView {
//                            NavigationLink(destination: ScanViewController(recognizedText: $recognizedText)) {
//                                    Text("Press on me")
//                                 }.buttonStyle(PlainButtonStyle())
//                           .padding()
//                           .foregroundColor(.white)
//                           .background(Capsule().fill(Color.blue))
//                       }
//                       .padding()
                   }
                   .navigationBarTitle("Text Recognition")
               }
    }
}
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
