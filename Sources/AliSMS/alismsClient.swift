//
//  File.swift
//  
//
//  Created by xj on 2020/3/31.
//

import Foundation

public struct AlismsClient {
    public init(scheme: String = "https", accessKeyId: String, accessKeySecret: String) {
        self.scheme = scheme
        self.regionId = AliSmsDefault.region
        self.accessKeyId = accessKeyId
        self.accessKeySecret = accessKeySecret
    }
    
    let scheme: String
    let regionId: String
    let accessKeyId: String
    let accessKeySecret: String
}
    
