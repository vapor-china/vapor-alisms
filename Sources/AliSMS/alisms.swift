//
//  alisms.swift
//  App
//
//  Created by xj on 2019/12/31.
//

import Vapor

extension AlismsClient {
    
    var requestDomain: String {
      "\(scheme)://dysmsapi.aliyuncs.com"
    }
    
    var dataTimeFormat: String {
        "yyyy-MM-dd'T'HH:mm:ss'Z'"
    }
    
}

extension AlismsClient {
    
     public func sendSms(code: SMSCode, phone: String, signName: String, templateCode: String, req: Request) throws -> EventLoopFuture<AliResponseStatusCode> {
        
        let paramData = try! JSONEncoder().encode(code)
        let paramStr = String(data: paramData, encoding: .utf8)
        guard let param = paramStr else {
            
            throw AliSMSError(message: "参数异常")
        }
        
        do {
            return try request(phone: phone, signName: signName, templateCode: templateCode, templateParam: param, outId: "", req: req)
        } catch let e {
            req.logger.error("sendSms:\(e.localizedDescription)")
            return AliResponseStatusCode.unkown.encodeResponse(for: req).map { _ in .unkown }
        }
    }
}

extension AlismsClient {
    
    func request(phone: String, signName: String, templateCode: String, templateParam: String, outId: String, req: Request) throws -> EventLoopFuture<AliResponseStatusCode> {
        
        let time = AliSignTool.getCurrentTime(format: dataTimeFormat, timeZone: "GMT")
        
        let format = "JSON"
        let signatureMethod = "HMAC-SHA1"
        let signatureVersion: String = "1.0"
        let action: String = "SendSms"
        let version: String = "2017-05-25"
        let signaturenonce = UUID().uuidString
        
        let container = AliSmsContainer(AccessKeyId: accessKeyId,
                                        Timestamp: time,
                                        Format: format,
                                        SignatureMethod: signatureMethod,
                                        SignatureVersion: signatureVersion,
                                        SignatureNonce: signaturenonce,
                                        Signature: "",
                                        Action: action,
                                        Version: version,
                                        RegionId: regionId,
                                        PhoneNumbers: phone,
                                        SignName: signName,
                                        TemplateCode: templateCode,
                                        TemplateParam: templateParam,
                                        OutId: outId)
        
        let requestUrl = generateUrl(param: container, signer: SHAHAMC1Singer())

        let uri = URI.init(string: requestUrl)
        let resp = req.client.get(uri)

        
        let status = parseResponse(req: req, resp: resp)
        
        return status
    }
    
        func parseResponse(req: Request,resp: EventLoopFuture<ClientResponse>, type: String = "JSON") -> EventLoopFuture<AliResponseStatusCode> {
            
            if type == "JSON" {
                
             let result = resp.flatMapThrowing { (res) -> AliResponseStatusCode in
               
                let result = try res.content.decode(AliResponse.self)
                
                let status = AliResponseStatusCode.compare(with: result.Code)
                    return status
                }
                
               return result
                
            }
            
        
            return AliResponseStatusCode.unkown.encodeResponse(for: req).map { _ in .unkown }
        }
    

    
    func generateUrl(param: AliSmsContainer, signer: SHAHAMC1Singer) -> String {
        
        let dic = MirrorExt.generateDic(model: param)

        let dic2 = dic.sorted { (k1, k2) -> Bool in
            return k1.key < k2.key
        }

        var queryString = ""

        for (k,v) in dic2 {
            queryString = queryString + "&" + k.aliSpecialUrlEncode() + "=" + v.aliSpecialUrlEncode()
        }

        let signQuery = String(queryString.dropFirst(1))

        let sign = "GET" + "&" + "/".aliSpecialUrlEncode() + "&" + signQuery.aliSpecialUrlEncode()

        let key = accessKeySecret+"&"

        let signature = signer.sign(sign, key: key)

        var characters = CharacterSet.urlQueryAllowed
        characters.remove(charactersIn: "!*'\"();:@&=+$,/?%#[]% ")

        //get
        let url = requestDomain + "/?Signature=" + (signature.addingPercentEncoding(withAllowedCharacters: characters) ?? signature) + queryString

        return url
    }
    
    
}






