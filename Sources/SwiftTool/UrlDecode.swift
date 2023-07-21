//
//  UrlDecode.swift
//  
//
//  Created by jzh on 2023/7/14.
//

import Foundation

public func decodeURLString(_ urlString: String) -> String? {
    if let decodedString = urlString.removingPercentEncoding {
        return decodedString
    }
    return nil
}
