//
//  File.swift
//  
//
//  Created by xj on 2020/3/31.
//

import CryptoSwift

struct SHAHAMC1Singer: AliSign {
    
    func sign(_ content: String, key: String) throws -> String {
        let msg = Array(content.utf8)
        let result = try HMAC(key: key, variant: .sha1).authenticate(msg)
        return result.base64
    }
}
