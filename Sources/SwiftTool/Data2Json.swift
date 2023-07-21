//
//  Data2Json.swift
//  
//
//  Created by jzh on 2023/7/14.
//

import Foundation

public func json(from data: Data) -> [String: Any]? {
    do {
        // 将 data 转换为 JSON 对象
        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            // 在这里可以使用 json 对象，它是一个字典（[String: Any]）类型
            return json
        }
        return nil
    } catch {
        print("JSON 转换失败：\(error)")
        return nil
    }
}
