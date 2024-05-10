//
//  UIScreen+current.swift
//  Lesson13HW
//
//  Created by Vika on 11.04.2024.
//

import UIKit

extension UIWindow {
    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}

extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
    
    static var height: CGFloat {
        UIScreen.current?.bounds.height ?? 0
    }
}
