//
//  Base64ToImage.swift
//  
//
//  Created by jzh on 2023/7/14.
//

#if canImport(UIKit)
import UIKit

public func imageFromBase64String(_ base64String: String) -> UIImage? {
    if let imageData = Data(base64Encoded: base64String) {
        let image = UIImage(data: imageData)
        return image
    }
    return nil
}

#endif

#if canImport(AppKit)
import AppKit

public func imageFromBase64String(_ base64String: String) -> NSImage? {
    if let imageData = Data(base64Encoded: base64String) {
        let image = NSImage(data: imageData)
        return image
    }
    return nil
}

#endif
