//
//  MatchVC.swift
//  uportthon
//
//  Created by hayato.iida on 2018/07/21.
//  Copyright © 2018年 hayato.iida. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class MatchVC: UIViewController {
  @objc func match() {
    let req = request("https://wdoms43kzb.execute-api.us-east-1.amazonaws.com/dev/users?public_key=\(Store.shared.publicKey)")
    req.responseJSON(completionHandler: { (response) in
      guard let object = response.result.value else {
        return
      }
      Store.shared.list = JSON(object)

      let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListVC")
      self.present(vc!, animated: true, completion: nil)
    })


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
