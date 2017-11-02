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
<<<<<<< HEAD
    //用户昵称
    var screen_name:String?
    //用户头像地址
    var avatar_large:String?
    // access_token 的生命周期，单位是秒数
    
    
=======
    // access_token 的生命周期，单位是秒数
    
>>>>>>> b11f3026ed22a46246da08739a2d0373025507e7
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
<<<<<<< HEAD
     
    override var description: String{
        let keys = ["access_token","expires_in","expiresDate","uid","screen_name","avatar_large"]
        return dictionaryWithValues(forKeys: keys).description
    }
    // 过期日期
    
=======
    override var description: String{
        let keys = ["access_token","expires_in","expiresDate","uid"]
        return dictionaryWithValues(forKeys: keys).description
    }
    // 过期日期
    var expiresDate:NSDate?
>>>>>>> b11f3026ed22a46246da08739a2d0373025507e7
    var expires_in: TimeInterval = 0{
        didSet {
            //计算过期日期
           expiresDate = NSDate(timeIntervalSinceNow: expires_in)
        }
    }
<<<<<<< HEAD
    var expiresDate: NSDate?
=======
>>>>>>> b11f3026ed22a46246da08739a2d0373025507e7

}
