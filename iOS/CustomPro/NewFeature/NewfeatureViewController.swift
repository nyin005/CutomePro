//
//  NewfeatureViewController.swift
//  CustomPro
//
//  Created by appledev110 on 10/23/16.
//  Copyright © 2016 appledev110. All rights reserved.
//

import UIKit

class NewfeatureViewController: UIViewController, UIScrollViewDelegate {

    var newFeatureCount = 4
    var pageControl : UIPageControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = UIScrollView(frame:self.view.bounds)
        scrollView.contentSize = CGSize(width: Int(scrollView.frame.width) * newFeatureCount, height: 0)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        self.view.addSubview(scrollView)
        scrollView.delegate = self
        for i in 0 ..< newFeatureCount {
            let imageView = UIImageView()
            imageView.frame.size = scrollView.frame.size
            imageView.frame.origin.y = 0
            imageView.frame.origin.x = CGFloat(i * Int(imageView.frame.width))
            
            let imageName = "new_feature_\(i + 1)"
            imageView.image = UIImage(named: imageName)
            scrollView.addSubview(imageView)
            
            if i == newFeatureCount - 1 {
                setUpLastImagView(imageView: imageView)
            }
            pageControl = UIPageControl()
            pageControl?.numberOfPages = newFeatureCount
            pageControl?.center.x = scrollView.frame.width * 0.5
            pageControl?.center.y = scrollView.frame.height - 50
            pageControl?.pageIndicatorTintColor = UIColor.lightGray
            pageControl?.currentPageIndicatorTintColor = UIColor.orange
            self.view.addSubview(pageControl!)
        }
    }
    
    func setUpLastImagView(imageView: UIImageView) {
        imageView.isUserInteractionEnabled = true
        let startBtn = UIButton()
        startBtn.setBackgroundImage(UIImage(named: "new_feature_finish_button"), for: .normal)
        startBtn.setBackgroundImage(UIImage(named: "new_feature_finish_button_highlighted"), for: .highlighted)
        startBtn.frame.size = (startBtn.currentBackgroundImage?.size)!
        startBtn.center.x = imageView.frame.width * 0.5
        startBtn.center.y = imageView.frame.height * 0.65
        startBtn.setTitle("开始", for: .normal)
        startBtn.addTarget(self, action: #selector(NewfeatureViewController.startClick), for: .touchUpInside)
        imageView.addSubview(startBtn)
    }
// 销毁被调用
    deinit {
        print("NewfeatureViewController-dealloc")
    }
    func startClick() {
        let window = UIApplication.shared.keyWindow
        window?.rootViewController = RootTabBarViewController()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.width
        self.pageControl?.currentPage = Int(page + 0.5)
    }

}
