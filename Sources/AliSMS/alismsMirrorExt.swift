//
//  File.swift
//  
//
//  Created by xj on 2020/3/31.
//

import Vapor


class MirrorExt {

    static func generateDic<T>(model: T) -> Dictionary<String,String> {

        var para : [String : String] = [:]

        let mir = Mirror(reflecting: model)

        for (fkey,fval) in mir.children {

            print("\(String(describing: fkey)) -- \(fval)")

            if let key = fkey,let val = fval as? String, val != "" {
               para[key] = val
            }
        }

        return para
    }
}
