//
//  UIViewController+init+className.swift
//  Lesson13HW
//
//  Created by Vika on 10.04.2024.
//

import UIKit

extension UIViewController {
    static var className: String {
        "\(Self.self)"
    }
    
    convenience init(bundle: Bundle? = nil) {
        self.init(nibName: UIViewController.className, bundle: bundle)
    }
}
