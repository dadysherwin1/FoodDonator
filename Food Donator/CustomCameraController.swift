import Foundation
import AVFoundation
import SwiftUI
import UIKit

class CustomCameraController: UIViewController {
    
    let captureSession = AVCaptureSession()
    
    var backFacingCamera: AVCaptureDevice?
    var frontFacingCamera: AVCaptureDevice?
    var currentDevice: AVCaptureDevice!
    
    var stillImageOutput: AVCapturePhotoOutput!
    var stillImage: UIImage?
    
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    private func configure() {
        // Preset the session for taking photo in full resolution
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    
        // Get the front and back-facing camera for taking photos
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera], mediaType: AVMediaType.video, position: .unspecified)
         
        for device in deviceDiscoverySession.devices {
            if device.position == .back {
                backFacingCamera = device
            } else if device.position == .front {
                frontFacingCamera = device
            }
        }
         
        currentDevice = backFacingCamera
         
        guard let captureDeviceInput = try? AVCaptureDeviceInput(device: currentDevice) else {
            return
        }
        
        stillImageOutput = AVCapturePhotoOutput()
        
        captureSession.addInput(captureDeviceInput)
        captureSession.addOutput(stillImageOutput)
        
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(cameraPreviewLayer!)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.frame = view.layer.frame
         
        // Bring the camera button to front
        view.bringSubviewToFront(cameraButton)
        captureSession.startRunning()
        
        
        
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
             
            configure()
    }
    
    @IBAction func capture(sender: UIButton) {
            // Set photo settings
            let photoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
            photoSettings.isHighResolutionPhotoEnabled = true
            photoSettings.flashMode = .auto
             
            stillImageOutput.isHighResolutionCaptureEnabled = true
            stillImageOutput.capturePhoto(with: photoSettings, delegate: self)
    }
    
    extension CustomCameraController: AVCapturePhotoCaptureDelegate {
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
            guard error == nil else {
                return
            }
             
            // Get the image from the photo buffer
            guard let imageData = photo.fileDataRepresentation() else {
                return
            }
             
            stillImage = UIImage(data: imageData)
        }
    }
    
    
    
//    var session: AVCaptureSession?
//    let output = AVCapturePhotoOutput()
//    let previewLayer = AVCaptureVideoPreviewLayer()
//
//    private let shutterButton: UIButton = {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//        button.layer.cornerRadius = 100
//        button.layer.borderWidth = 10
//        button.layer.borderColor = UIColor.white.cgColor
//        return button
//    }()
//
//    func bruh1() {
//        switch AVCaptureDevice.authorizationStatus(for: .video) {
//        case .notDetermined:
//
//            AVCaptureDevice.requestAccess(for: .video) { granted in
//                guard granted else {
//                }
//
//            }
//        case .restricted:
//            break
//        case .denied:
//            break
//        case .authorized:
//            setUpCamera()
//            break
//        default:
//            break
//        }
//    }
}
