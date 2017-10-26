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
    //加载用户信息
    func loadUserInfo(uid:String,accessToken:String,finished:@escaping HMRequestCallBack){
        let urlString = "https://api.weibo.com/2/users/show.json"
        let params = ["uid":uid,"access_token":accessToken]
        request(method: .GET, URLString: urlString, parameters: params as [String : AnyObject]?, finished: finished)
    }
    
    
    
    public let appKey = "4063265301"
    public let appSecret = "dd453737bd08752d8b71c68c98b66186"
    public let redirectUrl = "http://www.baidu.com"
    //单例
    static let sharedTools: NetworkTools = {
        let tools = NetworkTools(baseURL: nil)
        //tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
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
//        //设置相应数据格式是二进制
//         responseSerializer = AFHTTPResponseSerializer()
//        //发起网络请求
//        post(URLString, parameters: parameters, progress: nil, success: { (_, result)-> () in
//            let json = NSString(data: (result as! NSData) as Data, encoding: String.Encoding.utf8.rawValue)
//            print(json)
//        }, failure: nil)
        }
    //OAuth相关方法 
    //授权URL
    var OAuthURL:NSURL{
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(appKey)&redirect_uri=\(redirectUrl)&response_type=code"
        return NSURL(string:urlString)!
       
    }
    func loadAccessToken(code:String,finished:@escaping HMRequestCallBack){
        let urlString = "https://api.weibo.com/oauth2/access_token"
        let params = ["client_id":appKey,"client_secret":appSecret,"grant_type":"authorization_code","code":code,"redirect_uri":redirectUrl]
        request(method: .POST, URLString: urlString, parameters: params as [String : AnyObject]?, finished: finished)
    }

}
//HTTP请求
enum HMRequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}
