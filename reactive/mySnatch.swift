//
//  mySnatch.swift
//  reactive
//
//  Created by zp on 5/20/16.
//  Copyright © 2016 zp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class mySnatchTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var lastRoundId = "0"
    var lastWeight = "0"
    var hasMore = true
    var parameters = ["app_version": "1.0.1", "os_type":"ios", "channel":"OD_AppStore", "uid":"-1", "last_round_id": "0"]
    
    
    @IBOutlet weak var allTableList: UITableView!
    func getProductList() {
        parameters["last_round_id"] = self.lastRoundId
        parameters["last_weight"] = self.lastWeight
        if !self.hasMore{
            return
        }
        Alamofire.request(.GET, "http://b-one.aa123bb.com/list_pro_common.do", parameters: parameters)
            .responseJSON { response in
                if response.result.value != nil {
                    var jsonObj = JSON(response.result.value!)
                    var lastArr = [Int]()
                    var lastWeightArr = [Int]()
                    if let data = jsonObj["data"].arrayValue as [JSON]?{
                        for item in data {
                            lastArr.append(item["roundId"].intValue)
                            lastWeightArr.append(item["weight"].intValue)
                        }
                        
                        if(data.count > 0) {
                            self.lastRoundId = String(lastArr.minElement()!)
                            self.lastWeight = String(lastWeightArr.minElement()!)
                            self.products = self.products + data
                            self.allTableList.reloadData()
                        } else {
                            self.hasMore = false
                        }
                    }
                }
        }
    }
    
    
    var products: [JSON] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getProductList()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let productId = "productCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(productId, forIndexPath: indexPath) as! productCell
        let product = products[indexPath.row]
        
        let proPrice = Int(product["price"].intValue/100)
        let progressValue = Float(product["proProgress"].intValue * 100/proPrice)
        
        cell.title.text = product["title"].stringValue
        cell.progessText.text = "开奖进度\(progressValue)%"
        cell.progess.layer.cornerRadius = CGFloat(3)
        cell.progess.layer.masksToBounds = true
        cell.progess.progress = progressValue/100
        cell.totalNum.text = "总需\(proPrice)人次"
        
        cell.photo.kf_setImageWithURL(NSURL(string: product["listImage"].stringValue)!, placeholderImage: nil)
        return cell
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            //reach bottom
            self.getProductList()
        }
        
        if (scrollView.contentOffset.y < 0){
            //reach top
        }
        
        if (scrollView.contentOffset.y >= 0 && scrollView.contentOffset.y < (scrollView.contentSize.height - scrollView.frame.size.height)){
            //not top and not bottom
        }
    }
}