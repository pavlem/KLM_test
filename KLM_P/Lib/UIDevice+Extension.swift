//
//  UIDevice+Extension.swift
//  KLM_2_t
//
//  Created by Pavle Mijatovic on 29.11.21..
//

import UIKit

extension UIDevice {
    static var numberOfRows: Int {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return 4
        case .pad:
            return 8
            
        default:
            return 4
        }
    }
}
