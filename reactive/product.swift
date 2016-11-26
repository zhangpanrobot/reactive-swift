//
//  ViewController.swift
//  reactive
//
//  Created by zp on 4/22/16.
//  Copyright © 2016 zp. All rights reserved.
//

import UIKit

class Product:  NSObject{
    var photo:UIImage?
    var title: String
    var progress: Float
    init(photo: UIImage?, title: String, progress: Float) {
        self.photo = photo
        self.title = title
        self.progress = progress
        super.init()
    }
}

