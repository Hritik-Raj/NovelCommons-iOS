//
//  ScanView.swift
//  
//
//  Created by Pudding on 12/6/20.
//

import SwiftUI

struct ScanView: View {
    let controller = ScanViewController()
    
    var body: some View {
        controller
            .frame(width: 300, height: 400)
        Button("New page", action: controller.scanDocument)
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
