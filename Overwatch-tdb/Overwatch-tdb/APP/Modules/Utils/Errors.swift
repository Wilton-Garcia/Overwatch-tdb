//
//  Errors.swift
//  Overwatch-tdb
//
//  Created by Wilton Garcia on 14/10/20.
//

import Foundation

struct Errors: Error {
    let message: String

   /* init(_ message: String) {
        self.message = message
    }
   */
    
    var localizedDescription: String {
         message
    }
}
