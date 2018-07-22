//
//  CreateUserVC.swift
//  uportthon
//
//  Created by hayato.iida on 2018/07/21.
//  Copyright © 2018年 hayato.iida. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class CreateUserVC: UIViewController {

  @IBOutlet weak var state1: UITextField!
  @IBOutlet weak var state2: UITextField!

  @IBAction func submit(_ sender: Any) {
    let req = request("https://wdoms43kzb.execute-api.us-east-1.amazonaws.com/dev/users", method: .post, parameters: ["public_key":Store.shared.myKey, "hoby":state1.text!, "language":state2.text!], encoding:JSONEncoding.default, headers: nil)
    req.responseJSON(completionHandler: { (response) in
      guard let object = response.result.value else {
        return
      }

      print(JSON(object))
      self.dismiss(animated: false)
        bootVC.openLogin()
    })

  }

  var langPick = ["japanese", "english"]
  var hobyPick = ["tennis", "baseball"]

  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    let pickerView1 = UIPickerView()
    let pickerView2 = UIPickerView()

    pickerView1.delegate = Picker(pickOption: hobyPick, state1)
    pickerView2.delegate = Picker(pickOption: langPick, state2)

//    state1.inputView = pickerView1
//    state2.inputView = pickerView2
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

class Picker: NSObject, UIPickerViewDelegate {

  let pickOption: [String]
  let pickerTextField: UITextField
  init(pickOption: [String], _ pickerTextField: UITextField) {
    self.pickOption = pickOption
    self.pickerTextField = pickerTextField
  }

  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickOption.count
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickOption[row]
  }
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    pickerTextField.text = pickOption[row]
  }
}
