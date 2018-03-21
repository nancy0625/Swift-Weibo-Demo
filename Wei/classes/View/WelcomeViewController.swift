//
//  WelcomeViewController.swift
//  Wei
//
//  Created by apple on 18/3/21.
//  Copyright © 2018年 Student. All rights reserved.
//

//
//  WelcomeViewController.swift
//  Wei
//
//  Created by apple on 18/3/21.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    override func loadView() {
        view = backImageView
        setupUI()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //背景图片
    public lazy var backImageView:UIImageView = UIImageView(imageName:"ad_background")
    public lazy var iconView: UIImageView = {
        let iv = UIImageView(imageName:"avatar_default_big")
        iv.layer.cornerRadius = 45
        iv.layer.masksToBounds = true
        return iv
    }()
    public lazy var welcomeLabel: UILabel = UILabel(title:"欢迎归来",fontSize:18)
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension WelcomeViewController{
    public func setupUI(){
        //添加控件
        view.addSubview(iconView)
        
        //自动布局
        iconView.snp_makeConstraints{
            (make) in
            make.centerX.equalTo(view.snp_centerX)
            make.bottom.equalTo(view.snp_bottom).offset(-200)
            make.width.equalTo(90)
            make.height.equalTo(90)
        }
        view.addSubview(welcomeLabel)
        welcomeLabel.snp_makeConstraints{
            (make) in
            make.centerX.equalTo(iconView.snp_centerX)
            make.top.equalTo(iconView.snp_bottom).offset(16)
        }
        
    }
}

