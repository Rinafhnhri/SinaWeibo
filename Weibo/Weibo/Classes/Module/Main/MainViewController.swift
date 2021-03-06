//
//  MainViewController.swift
//  Weibo
//
//  Created by apple on 15/12/12.
//  Copyright © 2015年 itcast. All rights reserved.
//

//格式化代码
//control + i
// cmd + a -> cmd + x -> cmd + v

//cmd + shift + j 快速聚焦


//OC 中 大招  KVC
//setValue 和 setObject 有什么区别
import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tabBar 是只读属性 不能够直接进行设置  可以使用  KVC 在运行时 间接赋值 (改变身份)
        print(tabBar.classForCoder)
        let mainTabBar = MainTabBar()
        setValue(mainTabBar, forKey: "tabBar")
        //classForCoder 对象的类的字符串形式
        print(tabBar.classForCoder)
        //添加子视图控制器
        addChildViewControllers()
    }
    
    
    //private表示只能在本类中进行访问
    private func addChildViewControllers() {
        //HomeTableViewController() 需要修改
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(ProfileTableViewController(), title: "我", imageName: "tabbar_profile")
        
    }
    
    private func addChildViewController(vc: UIViewController,title: String,imageName: String) {
        self.tabBar.tintColor = UIColor.orangeColor()
        
        let nav = UINavigationController(rootViewController: vc)
        //        title = "首页"
        //        nav.title = "首页"
        vc.title = title
        //设置图片
        vc.tabBarItem.image = UIImage(named: imageName)
//        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
//        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.orangeColor()], forState: .Selected)
        //在swift中 self 可以省略
        self.addChildViewController(nav)
    }
    
}
