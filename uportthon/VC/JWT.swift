//
//  JWT.swift
//  uportthon
//
//  Created by hayato.iida on 2018/07/21.
//  Copyright © 2018年 hayato.iida. All rights reserved.
//

import Foundation
import uPortSDK
import UPTEthereumSigner

class JWT {
  func JWT(callback:@escaping UPTEthSignerJWTSigningResult) {
    let pKey = BTCDataFromHex("a5b515852a11fa564f905ba3c29327ea11eed568a22c68f58e483e96c098d7b6")

    UPTEthereumSigner.saveKey(pKey, protectionLevel: UPTEthKeychainProtectionLevel.normal) { (ethAddress, publicKey, error) in
      print(error)
      Store.shared.ethAddress = ethAddress
      if let publicKey = publicKey {
        Store.shared.publicKey = publicKey
      }
      let acc = Account(network: "0x04", address: Store.shared.ethAddress!)!

      var payload = JWTPayload()
      payload.iss = MNID.encode(account:acc)!
      payload.iat = Int(Date().timeIntervalSince1970 / 1000)
      payload.sub = MNID.encode(account:acc)!
      payload.claims = ["name":"Carol Crypteau"]

      try! UPTEthereumSigner.signJwt(Store.shared.ethAddress, userPrompt: "exethon", data: JSONEncoder().encode(payload).base64EncodedData(), result: callback)
    }
  }

}

class JWTPayload: Codable {
  /**
   * General
   */
  var iss: String = "" //Cannot be nil for signature verification
  var iat: Int?
  var sub: String?
  var aud: String?
  var exp: Int?
  var type: String?

  /**
   * Specific to selective disclosure REQUEST
   */
  var net: String?
  var act: String?
  var requested: [String]?
  var verified: [String]?
  var permissions: [String]?

  /**
   * Specific to selective disclosure RESPONSE
   * Also includes verified
   */
  var req: String? //original jwt request, REQUIRED for sign selective disclosure responses
  var nad: String? //The MNID of the Ethereum account requested using act in the Selective Disclosure Request
  var dad: String? //The devicekey as a regular hex encoded ethereum address as requested using act='devicekey' in the Selective Disclosure Request
  //var own: String?, //The self signed claims requested from a user.
  var own: [String: String]?
  var capabilities: [String]? //An array of JWT tokens giving client app the permissions requested. Currently a token allowing them to send push notifications

  /**
   * Specific to Verification
   * Also includes iss, sub, iat, exp, claim
   */
  //var claims: Map<String, Any>?, //An object containing one or more claims about sub eg: {"name":"Carol Crypteau"}
  var claims: [String: String]?
  /**
   * Specific to Private Chain
   * Also includes dad
   */
  var ctl: String? //Ethereum address of the Meta Identity Manager used to control the account
  var reg: String? //Ethereum address of the Uport Registry used on private chain
  var rel: String? //Url of relay service for providing gas on private network
  var fct: String? //Url of fueling service for providing gas on private network
  var acc: String? //Fuel token used to authenticate on above fct url
}
