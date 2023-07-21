//
//  Base64Decode.swift
//  
//
//  Created by jzh on 2023/7/14.
//

import Foundation

public func decode(from base64String: String) -> String? {
    if let decodedData = Data(base64Encoded: base64String) {
        // 解码成功，decodedData 是解码后的数据
        let decodedString = String(data: decodedData, encoding: .utf8)
        return decodedString
    }
    return nil
}
