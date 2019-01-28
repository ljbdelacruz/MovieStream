//
//  StringEncryptor.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 26/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import SwiftyRSA


class StringEncryptor {
    let publicKey = try! PublicKey(pemNamed: "mypublic_k")
    func encrypt(message: String) -> String {
        let testText = try! ClearMessage(string: message, using: .utf8)
        let encrytped = try! testText.encrypted(with: publicKey, padding: .PKCS1)
        let base64String = encrytped.base64String
        
        return base64String
    }
}
