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

    JWT().JWT { (data, error) in
      print(error)
      let url = URL(string: "https://id.uport.me/req/\(String.init(data: data!, encoding: .utf8))")
      UIApplication.shared.open(url!) { (result) in
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PageVC")
        self.present(vc!, animated: true)
      }
    }
  }
}
