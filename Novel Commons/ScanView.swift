//
//  ScanView.swift
//  
//
//  Created by Pudding on 12/6/20.
//

import SwiftUI
import VisionKit
import Vision

/*
struct ScanView: View {
    let controller = ScanViewController()
    
    var body: some View {
        VStack {
            controller
            Button("New page", action: controller.scanDocument)
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
*/

struct ScanView: UIViewControllerRepresentable {
    @Binding var recognizedText: String
    var book: Book
    
    func makeCoordinator() -> Coordinator {
        Coordinator(recognizedText: $recognizedText, parent: self, book: book)
    }
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scanCamController = VNDocumentCameraViewController()
        scanCamController.delegate = context.coordinator
        return scanCamController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        //yeet
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        var recognizedText: Binding<String>
        var processedText: String = ""
        var parent: ScanView
        var book: Book
        
        init(recognizedText: Binding<String>, parent: ScanView, book: Book) {
            self.recognizedText = recognizedText
            self.parent = parent
            self.book = book
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            print("Document camera finished with scan(s).")
            for pageNum in 0 ..< scan.pageCount {
                let image = scan.imageOfPage(at: pageNum)
                detectText(in: image)
            }
            controller.dismiss(animated: true, completion: nil)
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            print("Document camera canceled.")
            
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            print(error)
        }
        
        func detectText(in image: UIImage) {
            print("Detecting text...")
            
            guard let image = image.cgImage else {
                print("Invalid image")
                return
            }
            
            let request = VNRecognizeTextRequest { (request, error) in
                if let error = error {
                    print(error)
                } else {
                    self.handleResults(results: request.results)
                }
            }
            
            request.recognitionLevel = .accurate
            performRequest(request: request, image: image)
        }
        
        func performRequest(request: VNRecognizeTextRequest, image: CGImage) {
            print("Performing text recognition request...")
            
            let requests = [request]
            let handler = VNImageRequestHandler(cgImage: image, orientation: .up, options: [:])
            
            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    try handler.perform(requests)
                } catch let error {
                    print(error)
                }
            }
        }
                
        func handleResults(results: [Any]?) {
            print("Handling results...")
            
            guard let results = results, results.count > 0 else {
                print("Text not found")
                return
            }
            for result in results {
                if let observation = result as? VNRecognizedTextObservation {
                    for text in observation.topCandidates(1) {
                        //print(text.string)
                        processedText += text.string + "\n"
                    }
                }
            }
            //recognizedText.wrappedValue = processedText
            print("Creating new page...")
            book.newPage(text: processedText)
            print(processedText)
        }
    }
}
