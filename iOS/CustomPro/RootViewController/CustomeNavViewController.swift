//
//  CustomeNavViewController.swift
//  CustomPro
//
//  Created by appledev110 on 10/23/16.
//  Copyright © 2016 appledev110. All rights reserved.
//

import UIKit

class CustomeNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
}
