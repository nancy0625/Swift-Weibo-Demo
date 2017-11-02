//
//  UserAccount.swift
//  Wei
//
//  Created by apple on 17/10/26.
//  Copyright © 2017年 Student. All rights reserved.
//

import UIKit

class UserAccount: NSObject {
    //用于调用access_token,接口获取授权后的access token
    var access_token:String?
    // 当授权用户的UID
    var uid:String?
    //用户昵称
    var screen_name:String?
    //用户头像地址
    var avatar_large:String?
    // access_token 的生命周期，单位是秒数
    
    
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    override var description: String{
        let keys = ["access_token","expires_in","expiresDate","uid","screen_name","avatar_large"]
        return dictionaryWithValues(forKeys: keys).description
    }
    // 过期日期....
    
    var expires_in: TimeInterval = 0{
        didSet {
            //计算过期日期
            expiresDate = NSDate(timeIntervalSinceNow: expires_in)
        }
    }
    var expiresDate: NSDate?
    
}

