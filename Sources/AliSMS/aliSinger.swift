//
//  File.swift
//  
//
//  Created by xj on 2020/3/31.
//

import Vapor
//import CryptoSwift
#if os(Linux)
import Crypto
#else
import CryptoKit
#endif

struct SHAHAMC1Singer: AliSign {
    
    func sign(_ content: String, key: String) throws -> String {
//        let msg = Array(content.utf8)
//        let result = try HMAC(key: key, variant: .sha1).authenticate(msg)
//        return result.base64
        return encodeWithHMAC(content: content, key: key)
    }
    
    func encodeWithHMAC(content: String, key: String) -> String {
        let keyData = key.data(using: .utf8)!
        
        let skey = SymmetricKey(data: keyData)
        var hmac = HMAC<Insecure.SHA1>(key: skey)
        
        let contentData = content.data(using: .utf8)!
        hmac.update(data: contentData)
        
        let result = hmac.finalize()
        let data = result.withUnsafeBytes { (rp) -> Data in
            return Data(bytes: rp.baseAddress!, count: result.byteCount)
        }
        let base64String = data.base64EncodedString()
        return base64String
    }
}
