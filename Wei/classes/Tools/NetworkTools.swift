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

}
//HTTP请求
enum HMRequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}
