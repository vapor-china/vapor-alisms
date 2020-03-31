//
//  File.swift
//  
//
//  Created by xj on 2020/3/31.
//

import Foundation

public struct AliSMSError: Error {
    
    public var message: String
    public var code: AliResponseStatusCode
    
    public init(code: AliResponseStatusCode = .unkown, message: String? = nil) {
        self.code = code
        self.message = message ?? code.desc
    }
}
