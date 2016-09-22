//
//  PageViewController.swift
//  SamplePageView3
//
//  Created by 中村祐太 on 2016/09/22.
//  Copyright © 2016年 中村祐太. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getPage(number: 1)], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
        self.delegate = self
    }
    var willTransitionToVC: UIViewController = UIViewController()
    func getPage(number:Int) -> UIViewController {
        return storyboard!.instantiateViewController(withIdentifier: "Page\(number)ViewController")
    }
}
extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    // MARK: - UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController is (Page3ViewController) {
            // 3 -> 2
            return getPage(number: 2)
        } else if viewController is (Page2ViewController) {
            // 2 -> 1
            return getPage(number: 1)
        } else {
            // 1 -> end of the road
            return nil
        }
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if viewController is (Page1ViewController) {
            // 1 -> 2
            return getPage(number: 2)
        } else if viewController is (Page2ViewController) {
            // 2 -> 3
            return getPage(number: 3)
        } else {
            // 3 -> end of the road
            return nil
        }
    }
    // MARK: - UIPageViewControllerDelegate
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            let parentVC = self.parent as! ViewController
            parentVC.pageControl.currentPage = { Int in
                switch self.willTransitionToVC {
                case is Page1ViewController: return 0
                case is Page2ViewController: return 1
                case is Page3ViewController: return 2
                default: return 0
                }
            }()
        }
    }
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        willTransitionToVC = pendingViewControllers[0]
    }
}
