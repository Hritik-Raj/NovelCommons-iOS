//
//  ScanViewController.swift
//  
//
//  Created by Pudding on 12/5/20.
//

import SwiftUI
import UIKit
import Vision
import VisionKit

final class ScanViewController: UIViewController, VNDocumentCameraViewControllerDelegate {
    var scanCam: VNDocumentCameraViewController?
    var previewView: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        print("View did appear")
        scanDocument()
        super.viewDidAppear(animated)
    }
    
    //@objc
    func scanDocument() {
        guard VNDocumentCameraViewController.isSupported else { print("Document scanning not supported."); return}
        
        scanCam = VNDocumentCameraViewController()
        scanCam?.delegate = self
        present(scanCam!, animated: true, completion: nil)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        scanCam?.dismiss(animated: true, completion: nil)
        scanCam = nil
        
        for pageNum in 0 ..< scan.pageCount {
            let image = scan.imageOfPage(at: pageNum)
            detectText(in: image)
        }
    }
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        scanCam?.dismiss(animated: true, completion: nil)
    }
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        print(error)
    }
    
    func detectText(in image: UIImage) {
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
        guard let results = results, results.count > 0 else {
            print("Text not found")
            return
        }
        for result in results {
            if let observation = result as? VNRecognizedTextObservation {
                for text in observation.topCandidates(1) {
                    print(text.string + "\n")
                }
            }
        }
    }
    
}
extension ScanViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = ScanViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ScanViewController>) -> ScanViewController {
        return ScanViewController()
    }
    
    func updateUIViewController(_ uiViewController: ScanViewController, context: UIViewControllerRepresentableContext<ScanViewController>) {
    }
}
