//
//  TableView+reusingCell.swift
//  Lesson13HW
//
//  Created by Vika on 10.04.2024.
//

import UIKit

protocol ReusingCell {
    static var className: String { get }
}

extension ReusingCell  {
    
    static var className: String {
        "\(Self.self)"
    }
    
    static var reuseIdentifier: String {
        return self.className
    }
    
    static var nib : UINib {
        return UINib(nibName: self.className, bundle: nil)
    }
}

extension UITableViewCell : ReusingCell {}
