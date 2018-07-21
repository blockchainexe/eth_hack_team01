//
//  PageVC.swift
//  uportthon
//
//  Created by hayato.iida on 2018/07/21.
//  Copyright © 2018年 hayato.iida. All rights reserved.
//

import Foundation
import UIKit

class PageVC:UIPageViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setViewControllers([getProfile()], direction: .forward, animated: true, completion: nil)
    self.dataSource = self
  }

  func getProfile() -> ProfileVC {
    return storyboard!.instantiateViewController(withIdentifier: "Profile") as! ProfileVC
  }

  func getMatch() -> MatchVC {
    return storyboard!.instantiateViewController(withIdentifier: "Match") as! MatchVC
  }

}


extension PageVC : UIPageViewControllerDataSource {
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return 2
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    if viewController is MatchVC {
      // 2 -> 1
      return getProfile()
    } else {
      // 2 -> end of the road
      return nil
    }
  }
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    if viewController is ProfileVC {
      // 1 -> 2
      return getMatch()
    } else {
      // 2 -> end of the road
      return nil
    }
  }
}
