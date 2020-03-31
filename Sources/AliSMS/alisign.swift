//
//  alisign.swift
//  App
//
//  Created by xj on 2019/12/31.
//

import Foundation


struct AliSignTool {
    /// 获取当前时间
    ///
    /// - Parameter format: 时间格式
    /// - Returns: 当前时间
    public static func getCurrentTime(format: String) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = format
        let currentDate = Date()
        let date = dateformatter.string(from: currentDate)
        return date
    }

    public static func getCurrentTime(format: String, timeZone: String) -> String {

        let datefmt = DateFormatter()
        datefmt.timeZone = TimeZone(identifier: timeZone)
        datefmt.dateFormat = format

        let date = Date()
        let currentdate = datefmt.string(from: date)

        return currentdate
    }

    public static func getTimeBy(timeStamp: String, format: String) -> String {

        let dateformatter = DateFormatter()
        dateformatter.dateFormat = format
        let tims = TimeInterval.init(timeStamp)
        let currentDate = Date(timeIntervalSince1970:tims!)
        let date = dateformatter.string(from: currentDate)
        return date
    }

    public static func getTimeBy(date: Date, format: String) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = format
        let currentdate = dateformatter.string(from: date)
        return currentdate
    }
}



extension String {
    
    func aliSpecialUrlEncode() -> String {
        
        let encode = self.urlEncoded()
        
        var finish = encode.replacingOccurrences(of: "+", with: "%20")
        finish = finish.replacingOccurrences(of: "*", with: "%2A")
        finish = finish.replacingOccurrences(of: "~", with: "%7E")
        
        // 官方文档 java 自动 url encode Swift此处未转码 补充转码
        finish = finish.replacingOccurrences(of: ":", with: "%3A")
        finish = finish.replacingOccurrences(of: "/", with: "%2F")
        finish = finish.replacingOccurrences(of: "=", with: "%3D")
        finish = finish.replacingOccurrences(of: "&", with: "%26")
        
        return finish
    }
}

extension String {

    //将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }

    //将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
}

protocol AliSign {
    func sign(_ content: String, key: String) throws -> String
}
