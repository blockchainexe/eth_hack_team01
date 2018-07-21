//
//  File.swift
//  uportthon
//
//  Created by hayato.iida on 2018/07/21.
//  Copyright © 2018年 hayato.iida. All rights reserved.
//

import Foundation
import SwiftyJSON
class Store {
  static var shared = Store()
  var publicKey: String = ""
  var list: JSON = [:]
  var ethAddress:String?
}
