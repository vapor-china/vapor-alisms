//
//  File.swift
//  
//
//  Created by xj on 2020/3/31.
//

import Vapor


struct AliSmsContainer : Content {
    
    // system parameters
    let AccessKeyId : String
    let Timestamp : String
    let Format : String//默认XML
    var SignatureMethod : String
    var SignatureVersion : String
    let SignatureNonce : String
    var Signature : String
    
    // business parameters
    let Action : String
    let Version : String
    let RegionId : String
    let PhoneNumbers : String
    var SignName : String
    let TemplateCode : String
    var TemplateParam: String
    var OutId : String
}


public struct AliSmsDefault {
    
    static public let product = "Dysmsapi"
    
    static public let domain = "dysmsapi.aliyuncs.com"
    
    static public let region = "cn-hangzhou"
    
    static public let endPointName = "cn-hangzhou"
}
