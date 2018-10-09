//
//  Filter404.swift
//  COpenSSL
//
//  Created by PlutusCat on 2018/8/30.
//

import PerfectHTTP

//MARK: 404过滤
struct Filter404: HTTPResponseFilter {

    func filterBody(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
        callback(.continue)
    }

    func filterHeaders(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
        if case .notFound = response.status {

            let scoreArray: [String: Any] = ["status": "404",
                                             "message": "文件\(response.request.path)不存在"]
            let jsonString = try? scoreArray.jsonEncodedString()

            response.setBody(string: jsonString ?? "")
            response.setHeader(.contentLength, value: "\(response.bodyBytes.count)")
            callback(.done)

        } else {
            callback(.continue)
        }
    }

}
