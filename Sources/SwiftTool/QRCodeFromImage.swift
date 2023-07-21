//
//  QRCodeFromImage.swift
//  
//
//  Created by jzh on 2023/7/14.
//

#if canImport(UIKit)

import UIKit

public func qrcode(from image: UIImage) -> String? {
    guard let ciImage = CIImage(image: image) else {
        return nil
    }
    
    let options = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
    let context = CIContext()
    let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: context, options: options)
    let features = detector?.features(in: ciImage)
    
    if let qrCode = features?.first as? CIQRCodeFeature {
        return qrCode.messageString
    }
    return nil
}

#endif

#if canImport(AppKit)

import AppKit

public func qrcode(from image: NSImage) -> String? {
    guard let ciImage = CIImage(data: image.tiffRepresentation!) else {
        return nil
    }
    
    let options: [String: Any] = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
    let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: options)
    
    let features = detector?.features(in: ciImage)
    
    if let qrCodeFeature = features?.first as? CIQRCodeFeature {
        let qrCodeString = qrCodeFeature.messageString ?? ""
        return qrCodeString
    }
    return nil
}

#endif
