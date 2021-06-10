//
//  MainViewController.swift
//  Weibo
//
//  Created by apple on 15/12/12.
//  Copyright © 2015年 itcast. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //添加子视图控制器
        addChildViewControllers()
    }
    
    
    //private表示只能在本类中进行访问
    private func addChildViewControllers() {
        let homeVC = HomeTableViewController()
        let nav = UINavigationController(rootViewController: homeVC)
//        title = "首页"
//        nav.title = "首页"
        homeVC.title = "首页"
        //在swift中 self 可以省略
        self.addChildViewController(nav)
    }

}
