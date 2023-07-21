//
//  GenerateQRCode.swift
//  
//
//  Created by jzh on 2023/7/14.
//

#if canImport(UIKit)
import UIKit
import CoreImage.CIFilterBuiltins

public func generateQRCode(from string: String) -> UIImage {
    let filter = CIFilter.qrCodeGenerator()
    let data = Data(string.utf8)
    filter.setValue(data, forKey: "inputMessage")
    filter.setValue("H", forKey: "inputCorrectionLevel") // 选择纠错级别
    
    if let outputImage = filter.outputImage {
        if let cgImage = CIContext().createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgImage)
        }
    }
    
    return UIImage(systemName: "xmark.circle") ?? UIImage()
}
#endif


#if canImport(AppKit)
import AppKit
import CoreImage.CIFilterBuiltins

public func generateQRCode(from string: String) -> NSImage {
    if let data = string.data(using: String.Encoding.ascii),
       let filter = CIFilter(name: "CIQRCodeGenerator")
    {
        filter.setValue(data, forKey: "inputMessage")
        if let qrCodeImage = filter.outputImage {
            let scaleX = NSScreen.main?.backingScaleFactor ?? 2.0
            let transform = CGAffineTransform(scaleX: scaleX, y: scaleX)
            let scaledImage = qrCodeImage.transformed(by: transform)
            
            let rep = NSCIImageRep(ciImage: scaledImage)
            let nsImage = NSImage(size: rep.size)
            nsImage.addRepresentation(rep)
            return nsImage
        }
    }
    
    return NSImage(systemSymbolName: "xmark.circle", accessibilityDescription: nil) ?? NSImage()
}
#endif
