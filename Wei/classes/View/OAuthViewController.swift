//
//  OAuthViewController.swift
//  Wei
//
//  Created by apple on 17/10/18.
//  Copyright © 2017年 Student. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController{
    private lazy var webView = UIWebView()
    //监听方法
    @objc private func close(){
        dismiss(animated: true, completion: nil)
    }
    override func loadView(){
        view = webView
        //设置代理
        webView.delegate = self
        
        // 设置导航栏
        title = "登录新浪微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(OAuthViewController.close))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", style: .plain, target: self, action: #selector(OAuthViewController.autoFill))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // 加载页面
        self.webView.loadRequest(NSURLRequest(url: NetworkTools.sharedTools.OAuthURL as URL) as URLRequest)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc private func autoFill(){
        let js = "document.getElementById('userId').value = '15382664921';" + "document.getElementById('passwd').value = '**********';"
        webView.stringByEvaluatingJavaScript(from: js)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension OAuthViewController:UIWebViewDelegate{
    ///将要加载请求的代理方法
    // webView  request  将要加载的请求
    // navigationType 页面跳转方式
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        //判断访问的主机是否是正确的
        if request.url?.absoluteString.hasPrefix("www.baidu.com") == false{
            return true
        }
        print("加载请求－－－－\(request.url?.absoluteString)")
        //query 就是URL中？后面的代码
        print("加载请求－－－\(request.url?.query)")
        
        //2. 从url中查询“code＝”后面的代码
        if request.url?.query?.hasPrefix("code=") == false{
            print("取消授权")
            close(1)
            return false
        }
        //3.从query字符串中提取“code＝”后面的授权代码   代码到此处。url中一定有 查询到自负，并且包含code=
        
        let code = request.url?.query?.substring(from: "code=".endIndex)
        print("授权码是.....\(code)")
        return true
    }
}
