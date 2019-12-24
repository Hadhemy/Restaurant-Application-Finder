//
//  AppDelegate.swift
//  RestaurantApp
//
//  Created by mac on 11/5/19.
//  Copyright © 2019 mac. All rights reserved.
//


import UIKit

@IBDesignable class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }

    func configure() {

    }
}
