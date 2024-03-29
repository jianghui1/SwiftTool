//
//  Request.swift
//  
//
//  Created by jzh on 2023/7/14.
//

import Foundation

// 使用 async 关键字声明异步函数
public func fetchData(from urlString: String) async throws -> (Data, URLResponse) {
    if let url = URL(string: urlString) {
        return try await URLSession.shared.data(from: url)
    }
    throw URLError(.badURL)
}

public func fetchData(from urlString: String, method: String, body: [String: Any]) async throws -> (Data, URLResponse) {
    // 将字典转换为Data类型
    guard let postData = try? JSONSerialization.data(withJSONObject: body, options: []) else {
        fatalError("请求body错误")
    }
    if let url = URL(string: urlString) {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = postData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return try await URLSession.shared.data(for: request)
    }
    else {
        throw URLError(.badURL)
    }
}
