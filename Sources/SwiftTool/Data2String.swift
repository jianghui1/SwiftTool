//
//  Data2String.swift
//  
//
//  Created by jzh on 2023/7/14.
//

import Foundation

public func string(from data: Data) -> String? {
    if let responseString = String(data: data, encoding: .utf8) {
        return responseString
    }
    return nil
}
