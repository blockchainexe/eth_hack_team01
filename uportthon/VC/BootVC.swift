//
//  BootVC.swift
//  uportthon
//
//  Created by hayato.iida on 2018/07/21.
//  Copyright © 2018年 hayato.iida. All rights reserved.
//

import UIKit
import uPortSDK

var bootVC: BootVC!
class BootVC: UIViewController {
  @IBAction func login(_ sender: Any) {
    bootVC.openLogin()

  }

    override func viewDidLoad() {
        super.viewDidLoad()
        bootVC = self

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
  func openLogin() {

    JWT().JWT { (result, error) in
      print(error)
      guard let  jwt = result else {
        return
      }
      let url = URL(string: "https://id.uport.me/req/?attestations=\(jwt.base64EncodedString())&callback_url=\("uport1".data(using: .utf8)!.base64EncodedString())")
      UIApplication.shared.open(url!) { (result) in
        print(result)
      }
      let vc = self.storyboard?.instantiateViewController(withIdentifier: "PageVC")
      self.present(vc!, animated: true)

    }
  }
}
