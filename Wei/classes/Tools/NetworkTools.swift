//
//  NetworkTools.swift
//  Wei
//
//  Created by apple on 17/10/11.
//  Copyright © 2017年 Student. All rights reserved.
//

import UIKit
import AFNetworking

class NetworkTools: AFHTTPSessionManager {
    public let appKey = "4063265301"
    private let appSecret = "dd453737bd08752d8b71c68c98b66186"
    public let redirectUrl = "http://www.baidu.com"
    //单例
    static let sharedTools: NetworkTools = {
        let tools = NetworkTools(baseURL: nil)
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
    return tools
    }()
    //网络请求回调
    typealias HMRequestCallBack = (Any?,URLSessionDataTask?)->()
    
   
}
extension NetworkTools{
    
    func request(method:HMRequestMethod, URLString:String,
                 parameters:[String:AnyObject]?,
                 finished:@escaping HMRequestCallBack)
    {
        let success = {(task:URLSessionDataTask?,result:Any?)->()
            in finished(result,nil)}
            let failure = {(task:URLSessionDataTask?,error:Error?)->() in finished(error,nil)}
        if method == HMRequestMethod.GET
        {
            get(URLString,parameters:parameters,progress: nil,
                success: success,failure: failure)
     
        }
            if method == HMRequestMethod.POST
            {
                post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
                
            }
        }
    //OAuth相关方法 
    //授权URL
    var OAuthURL:NSURL{
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(appKey)&redirect_uri=\(redirectUrl)"
        return NSURL(string: urlString)!
    }

}
//HTTP请求
enum HMRequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}
