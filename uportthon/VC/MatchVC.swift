//
//  MatchVC.swift
//  uportthon
//
//  Created by hayato.iida on 2018/07/21.
//  Copyright © 2018年 hayato.iida. All rights reserved.
//

import UIKit

class MatchVC: UIViewController {
  @objc func match(){
    let vc = storyboard?.instantiateViewController(withIdentifier: "ListVC")
    present(vc!, animated: true, completion: nil)

  }
  override func viewDidLoad() {
        super.viewDidLoad()

    let gesture = UISwipeGestureRecognizer(target: self, action: #selector(match))
    gesture.direction = .up
    view.addGestureRecognizer(gesture)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
