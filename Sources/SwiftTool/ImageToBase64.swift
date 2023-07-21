//
//  ImageToBase64.swift
//  
//
//  Created by jzh on 2023/7/14.
//

#if canImport(UIKit)

import UIKit

public func base64String(for image: UIImage) -> String? {
    if let imageData = image.pngData() {
        let base64String = imageData.base64EncodedString()
        return base64String
    }
    return nil
}

#endif

#if canImport(AppKit)

import AppKit

public func base64String(for image: NSImage) -> String? {
    
    if let tiffRepresentation = image.tiffRepresentation,
       let imageRep = NSBitmapImageRep(data: tiffRepresentation),
       let imageData = imageRep.representation(using: .png, properties: [:])
    {
        let base64String = imageData.base64EncodedString()
        return base64String
    }
    return nil
}

#endif


