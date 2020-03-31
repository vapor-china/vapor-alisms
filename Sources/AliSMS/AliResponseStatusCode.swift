//
//  AliResponseStatusCode.swift
//  App
//
//  Created by spectator Mr.Z on 2018/9/20.
//

import Vapor

public enum AliResponseStatusCode: String, Content {
    case ok = "OK"
    case RAM_PERMISSION_DENY = "isp.RAM_PERMISSION_DENY"
    case OUT_OF_SERVICE = "isv.OUT_OF_SERVICE"
    case PRODUCT_UN_SUBSCRIPT = "isv.PRODUCT_UN_SUBSCRIPT"
    case PRODUCT_UNSUBSCRIBE = "isv.PRODUCT_UNSUBSCRIBE"
    case ACCOUNT_NOT_EXISTS = "isv.ACCOUNT_NOT_EXISTS"
    case ACCOUNT_ABNORMAL = "isv.ACCOUNT_ABNORMAL"
    case SMS_TEMPLATE_ILLEGAL = "isv.SMS_TEMPLATE_ILLEGAL"
    case SMS_SIGNATURE_ILLEGAL = "isv.SMS_SIGNATURE_ILLEGAL"
    case INVALID_PARAMETERS = "isv.INVALID_PARAMETERS"
    case SYSTEM_ERROR = "isp.SYSTEM_ERROR"
    case MOBILE_NUMBER_ILLEGAL = "isv.MOBILE_NUMBER_ILLEGAL"
    case MOBILE_COUNT_OVER_LIMIT = "isv.MOBILE_COUNT_OVER_LIMIT"
    case TEMPLATE_MISSING_PARAMETERS = "isv.TEMPLATE_MISSING_PARAMETERS"
    case BUSINESS_LIMIT_CONTROL = "isv.BUSINESS_LIMIT_CONTROL"
    case INVALID_JSON_PARAM = "isv.INVALID_JSON_PARAM"
    case BLACK_KEY_CONTROL_LIMIT = "isv.BLACK_KEY_CONTROL_LIMIT"
    case PARAM_LENGTH_LIMIT = "isv.PARAM_LENGTH_LIMIT"
    case PARAM_NOT_SUPPORT_URL = "isv.PARAM_NOT_SUPPORT_URL"
    case AMOUNT_NOT_ENOUGH = "isv.AMOUNT_NOT_ENOUGH"
    case unkown
    
public var desc : String {
        switch self {
        case .ok:
            return "请求成功"
        case .RAM_PERMISSION_DENY:
            return "RAM权限DENY"
        case .OUT_OF_SERVICE:
            return "业务停机"
        case .PRODUCT_UN_SUBSCRIPT:
            return "未开通云通信产品的阿里云客户"
        case .PRODUCT_UNSUBSCRIBE:
            return "产品未开通"
        case .ACCOUNT_NOT_EXISTS:
            return "账户不存在"
        case .ACCOUNT_ABNORMAL:
           return  "账户异常"
        case .SMS_TEMPLATE_ILLEGAL:
           return  "短信模板不合法"
        case .SMS_SIGNATURE_ILLEGAL:
            return "短信签名不合法"
        case .INVALID_PARAMETERS:
            return "参数异常"
        case .SYSTEM_ERROR:
            return "系统错误"
        case .MOBILE_NUMBER_ILLEGAL:
            return "非法手机号"
        case .MOBILE_COUNT_OVER_LIMIT:
            return "手机号码数量超过限制"
        case .TEMPLATE_MISSING_PARAMETERS:
           return  "模板缺少变量"
        case .BUSINESS_LIMIT_CONTROL:
           return  "业务限流"
        case .INVALID_JSON_PARAM:
            return "JSON参数不合法，只接受字符串值"
        case .BLACK_KEY_CONTROL_LIMIT:
           return  "黑名单管控"
        case .PARAM_LENGTH_LIMIT:
           return  "参数超出长度限制"
        case .PARAM_NOT_SUPPORT_URL:
            return "不支持URL"
        case .AMOUNT_NOT_ENOUGH:
            return "账户余额不足"
        default:
            return "未知错误"
        }
    }
    
static func compare(with: String) -> AliResponseStatusCode {
    
    switch with {
    case AliResponseStatusCode.ok.rawValue:
    return .ok
    case AliResponseStatusCode.RAM_PERMISSION_DENY.rawValue:
    return .RAM_PERMISSION_DENY
    case AliResponseStatusCode.OUT_OF_SERVICE.rawValue:
    return .OUT_OF_SERVICE
    case AliResponseStatusCode.PRODUCT_UN_SUBSCRIPT.rawValue:
    return .PRODUCT_UN_SUBSCRIPT
    case AliResponseStatusCode.PRODUCT_UNSUBSCRIBE.rawValue:
    return .PRODUCT_UNSUBSCRIBE
    case AliResponseStatusCode.ACCOUNT_NOT_EXISTS.rawValue:
    return .ACCOUNT_NOT_EXISTS
    case AliResponseStatusCode.ACCOUNT_ABNORMAL.rawValue:
    return  .ACCOUNT_ABNORMAL
    case AliResponseStatusCode.SMS_TEMPLATE_ILLEGAL.rawValue:
    return  .SMS_TEMPLATE_ILLEGAL
    case AliResponseStatusCode.SMS_SIGNATURE_ILLEGAL.rawValue:
    return .SMS_SIGNATURE_ILLEGAL
    case AliResponseStatusCode.INVALID_PARAMETERS.rawValue:
    return .INVALID_PARAMETERS
    case AliResponseStatusCode.SYSTEM_ERROR.rawValue:
    return .SYSTEM_ERROR
    case AliResponseStatusCode.MOBILE_NUMBER_ILLEGAL.rawValue:
    return .MOBILE_NUMBER_ILLEGAL
    case AliResponseStatusCode.MOBILE_COUNT_OVER_LIMIT.rawValue:
    return .MOBILE_COUNT_OVER_LIMIT
    case AliResponseStatusCode.TEMPLATE_MISSING_PARAMETERS.rawValue:
    return  .TEMPLATE_MISSING_PARAMETERS
    case AliResponseStatusCode.BUSINESS_LIMIT_CONTROL.rawValue:
    return  .BUSINESS_LIMIT_CONTROL
    case AliResponseStatusCode.INVALID_JSON_PARAM.rawValue:
    return .INVALID_JSON_PARAM
    case AliResponseStatusCode.BLACK_KEY_CONTROL_LIMIT.rawValue:
    return  .BLACK_KEY_CONTROL_LIMIT
    case AliResponseStatusCode.PARAM_LENGTH_LIMIT.rawValue:
    return  .PARAM_LENGTH_LIMIT
    case AliResponseStatusCode.PARAM_NOT_SUPPORT_URL.rawValue:
    return .PARAM_NOT_SUPPORT_URL
    case AliResponseStatusCode.AMOUNT_NOT_ENOUGH.rawValue:
    return .AMOUNT_NOT_ENOUGH
    default:
    return .unkown
    }
    
    }
}
