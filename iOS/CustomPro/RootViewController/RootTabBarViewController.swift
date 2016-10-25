//
//  RootTabBarViewController.swift
//  CustomPro
//
//  Created by appledev110 on 10/23/16.
//  Copyright © 2016 appledev110. All rights reserved.
//

import UIKit

class RootTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    func initUI() {
        let first = NewsViewController()
        self.addChildVc(childVc: first, title: "新闻", image: "tabbar_home", selectedImage: "tabbar_home_selected")
        
        let second = FoodViewController()
        self.addChildVc(childVc: second, title: "菜谱", image: "tabbar_message_center", selectedImage: "tabbar_message_center_selected")
        
        let third = CalendarViewController()
        self.addChildVc(childVc: third, title: "日历", image: "tabbar_discover", selectedImage: "tabbar_discover_selected")
        
        let four = MineViewController()
        self.addChildVc(childVc: four, title: "我的", image: "tabbar_profile", selectedImage: "tabbar_profile_selected")
        
        
    }
    func addChildVc(childVc: UIViewController, title: String, image: String, selectedImage: String) {
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: image)
        childVc.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        
        childVc.tabBarItem.setTitleTextAttributes(NSDictionary(object:UIColor.gray, forKey:NSForegroundColorAttributeName as NSCopying) as? [String : AnyObject], for: .normal)
        childVc.tabBarItem.setTitleTextAttributes(NSDictionary(object:UIColor.orange, forKey:NSForegroundColorAttributeName as NSCopying) as? [String : AnyObject], for: .selected)
        
        let nav = CustomeNavViewController(rootViewController: childVc)
        self.addChildViewController(nav)
        
    }

}
