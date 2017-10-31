//
//  HistoryViewController.swift
//  simple-calc-iOS
//
//  Created by YuanShaochen on 2017/10/30.
//  Copyright © 2017年 Su Wang. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    var history = [String]()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: Int(view.frame.size.width), height: Int(view.frame.size.height))
        
        for i in 0..<history.count {
            let label = UILabel(frame: CGRect(x: 0, y: i*30, width: Int(self.view.frame.size.width), height: 25))
            
            label.textAlignment = .left
            label.text = history[i]
            self.scrollView.addSubview(label)
        }
        
    }

 


}
