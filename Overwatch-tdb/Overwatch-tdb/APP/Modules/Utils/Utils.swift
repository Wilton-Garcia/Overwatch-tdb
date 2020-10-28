//
//  Utils.swift
//  Overwatch-tdb
//
//  Created by Wilton Garcia on 09/10/20.
//

import Foundation
import UIKit


    func isIphone() -> Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }

    func isLandscape() -> Bool {
        UIDevice.current.orientation.isLandscape
    }
