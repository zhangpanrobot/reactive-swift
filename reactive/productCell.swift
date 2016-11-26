//
//  productCellController.swift
//  reactive
//
//  Created by zp on 4/23/16.
//  Copyright © 2016 zp. All rights reserved.
//

import UIKit

class productCell:  UITableViewCell{
    
//    tableView.registerClass(productCell.self, forCellWithReuseIdentifier: "productCell")
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var title: UITextView!
    
    @IBOutlet weak var progess: UIProgressView!
    
    @IBOutlet weak var totalNum: UITextView!
    
    @IBOutlet weak var progessText: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}