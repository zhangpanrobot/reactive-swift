//
//  slider.swift
//  reactive
//
//  Created by zp on 5/31/16.
//  Copyright © 2016 zp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class Slider: UIViewController{
    var imgArr = [
        "http://m.360buyimg.com/mobilecms/s720x350_jfs/t2905/310/1813674954/99777/2de9f43d/574c0048Nbdf201d8.jpg!q70.jpg",
        "http://img11.360buyimg.com/da/jfs/t2896/13/1824794020/100749/172efc13/574bf688N3a25bc6b.jpg",
        "http://img11.360buyimg.com/da/jfs/t2821/259/1724755619/97492/5ba31e63/5747ad5bN9db72220.jpg",
        "http://m.360buyimg.com/mobilecms/s720x350_jfs/t2725/248/1855685788/95288/8cf3cd63/574c121dN8a0d3d9d.jpg!q70.jpg",
        "http://img13.360buyimg.com/da/jfs/t2884/195/1376046232/64922/a98d555a/573c1c81N8d4188d5.jpg",
        "http://m.360buyimg.com/mobilecms/s720x350_jfs/t2746/124/1561419792/130193/e09f8caa/5742a8c4N79d7a07a.jpg!q70.jpg",
        "http://m.360buyimg.com/mobilecms/s720x350_jfs/t2668/15/1843588571/89838/113dabc/574bd09aN8df2f4fa.jpg!q70.jpg",
        "http://m.360buyimg.com/mobilecms/s720x350_jfs/t2656/249/1803973547/112278/e2dffbc9/574bd5e4N871fe491.jpg!q70.jpg"
    ]
    
//    var scrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView(frame: self.view.bounds)
        
        scrollView.backgroundColor = UIColor.whiteColor()
        
        let viewWidth = view.frame.size.width
        
        
        scrollView.contentSize = CGSizeMake(viewWidth*CGFloat(imgArr.count),view.frame.size.height)
        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        for (index,item) in imgArr.enumerate(){
            let imageView = UIImageView()
            imageView.sizeToFit()
            imageView.backgroundColor = UIColor.redColor()
            imageView.kf_setImageWithURL(NSURL(string: item)!, placeholderImage: nil, optionsInfo: [.Transition(ImageTransition.Fade(1))], completionHandler: { image, error, cacheType, imageURL in
                print("\(item): Finished")
            })
            var rect:CGRect = imageView.frame;
            rect.size.height = (viewWidth/72) * 35;
            rect.size.width = viewWidth;
            
            rect.origin.x = viewWidth*CGFloat(index);
            rect.origin.y = 0;
            
            imageView.frame = rect;
            
            scrollView.addSubview(imageView)
        }
        view.addSubview(scrollView)
    }
}
