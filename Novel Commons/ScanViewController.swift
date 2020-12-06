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
    var textRecognitionRequest = VNRecognizeTextRequest(completionHandler: nil)
    let textRecognitionWorkQueue = DispatchQueue(label: "TextRecognitionQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    var previewView: UIView!
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        previewView = UIView(frame: CGRect(x: 0, y:0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        view.addSubview(previewView)
        setupVision()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scanDocument()
    }
    
    @objc
    func scanDocument() {
        let scanViewController = VNDocumentCameraViewController()
        scanViewController.delegate = self
        present(scanViewController, animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        for pageNum in 0 ..< scan.pageCount {
            let image = scan.imageOfPage(at: pageNum)
        }
        
        controller.dismiss(animated: true)
    }
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        print(error)
        controller.dismiss(animated: true)
    }
    
    private func setupVision() {
        textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            var detectedText = ""
            for observation in observations {
                guard let topCandidate = observation.topCandidates(1).first else { return }
                detectedText += topCandidate.string + "\n"
            }
        }
        textRecognitionRequest.recognitionLevel = .accurate
        
    }
    
    private func recognizeTextInImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
        textRecognitionWorkQueue.async {
            let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            do {
                try requestHandler.perform([self.textRecognitionRequest])
            } catch {
                print(error)
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
