import UIKit
import AVFoundation
import Foundation

class ReadQrCode: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var viewInputData: UIView!
    
    var captureSession: AVCaptureSession?
    var videoPreviewLaer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readQrCode()
        
        
    }
    
    
    func readQrCode() {
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
            
            videoPreviewLaer = AVCaptureVideoPreviewLayer.init(session: captureSession)
            videoPreviewLaer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLaer?.frame = view.layer.bounds
            //view.layer.addSublayer(videoPreviewLaer!)
            viewInputData.layer.addSublayer(videoPreviewLaer!)
            
            
            captureSession?.startRunning()
            
            view.bringSubview(toFront: infoLabel)
            
            
            qrCodeFrameView = UIView()
            
            
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                qrCodeFrameView.layer.borderWidth = 3
                
                //view.addSubview(qrCodeFrameView)
                //view.bringSubview(toFront: qrCodeFrameView)
                viewInputData.addSubview(qrCodeFrameView)
                viewInputData.bringSubview(toFront: qrCodeFrameView)
                
                
            }
        }catch {
            print(error)
            return
        }
    }
    
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            infoLabel.text = "QR Code is not detected"
            return
        }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        let barCOdeObject = videoPreviewLaer?.transformedMetadataObject(for: metadataObj)
        qrCodeFrameView?.frame = barCOdeObject!.bounds
        
        if metadataObj.stringValue != nil {
            infoLabel.text = metadataObj.stringValue
            qrData = infoLabel.text
            openOtherViewC()
        }
    }
    
    func openOtherViewC() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "BillInfo") as! ResultTableViewController
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.captureSession?.stopRunning()
    }
    
}







