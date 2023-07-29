//
//  PToolsManager.swift
//  Placidity
//
//  Created by 龚梦洋 on 2023/7/28.
//

import Foundation
import UIKit

class PToolsManager: NSObject {
    
    static func getWindows() -> [UIWindow] {
        var windows: [UIWindow] = []
        if #available(iOS 15.0, *) {
            windows = UIApplication.shared.connectedScenes.flatMap({ ($0 as? UIWindowScene)?.windows ?? []
            })
        } else {
            windows = UIApplication.shared.windows
        }
        return windows
    }
    
    static func getKeyWindow() -> UIWindow? {
        return PToolsManager.getWindows().filter { window in
            return window.isKeyWindow
        }.first
    }
}
