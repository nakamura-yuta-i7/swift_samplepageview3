//
//  ViewController.swift
//  SamplePageView3
//
//  Created by 中村祐太 on 2016/09/22.
//  Copyright © 2016年 中村祐太. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // PageViewControllerをコンテナに追加
        let pageVC = storyboard!.instantiateViewController(withIdentifier: "PageViewController") as! PageViewController
        addChildViewController(pageVC)
        view.addSubview(pageVC.view)
    }
}

