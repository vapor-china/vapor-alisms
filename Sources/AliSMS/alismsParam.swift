//
//  File.swift
//  
//
//  Created by xj on 2020/3/31.
//

import Vapor

public protocol SMSContent: Content {
    
}


public struct SMSCode: SMSContent {
    public init(code: String) {
        self.code = code
    }
    
    public let code: String
}




