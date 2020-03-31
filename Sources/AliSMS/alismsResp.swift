//
//  File.swift
//  
//
//  Created by xj on 2020/3/31.
//

import Vapor

struct AliResponse: Content {
    let Message: String
    let Code: String
    let RequestId: String
}
