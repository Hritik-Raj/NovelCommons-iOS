//
//  ScanViewController.swift
//  
//
//  Created by Pudding on 12/5/20.
//
/*
import SwiftUI
import UIKit
import Vision
import VisionKit

final class ScanViewController: UIViewController, VNDocumentCameraViewControllerDelegate {
    var scanCam: VNDocumentCameraViewController?
    
    override func viewDidLoad() {
        print("View did load.")
        
        super.viewDidLoad()
        //let tap = UITapGestureRecognizer(target: self, action: #selector(scanDocument))
        //self.view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("View did appear.")
        
        super.viewDidAppear(animated)
        scanDocument()
    }
    
    @objc
    func scanDocument() {
        print("Opening document scanner...")
        
        guard VNDocumentCameraViewController.isSupported else { print("Document scanning not supported."); return}
        
        scanCam = VNDocumentCameraViewController()
        scanCam?.delegate = self
        present(scanCam!, animated: true, completion: nil)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        print("Document camera finished with scan(s).")
        
        scanCam?.dismiss(animated: true, completion: nil)
        scanCam = nil
        
        for pageNum in 0 ..< scan.pageCount {
            let image = scan.imageOfPage(at: pageNum)
            detectText(in: image)
        }
    }
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        print("Document camera canceled.")
        
        scanCam?.dismiss(animated: true, completion: nil)
    }
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        print(error)
    }
    
    func detectText(in image: UIImage) {
        print("Detecting text...")
        sendImage(image)
        
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
    
    private func sendImage(_ image: UIImage) {
        print("Sending image...")
        let img = Image(uiImage: image)
        AnnotatePageView(image: img)
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
                    print(text.string)
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
*/
