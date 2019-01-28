//
//  Int+.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 26/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation


extension Int {
    func getErrorMessage() -> String {
        switch self {
        case 1001:
            return "Invalid Parameters."
        case 1002:
            return "All fields are required."
        default:
            return "An error occured."
        }
    }
    
}
