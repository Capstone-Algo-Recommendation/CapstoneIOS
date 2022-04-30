//
//  PRVC.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/04/30.
//

import UIKit
import SnapKit


class PRVC: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let scrollView = UIScrollView(frame: CGRect(x: 10, y: 10, width: view.frame.size.width-20, height: view.frame.size.height-20))
        scrollView.backgroundColor = .green
        view.addSubview(scrollView)
        
        let topButton = UIButton(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        topButton.backgroundColor = .blue
        scrollView.addSubview(topButton)
//        
//        let bottomButton = UIButton(frame: CGRect(x: 20, y: 2000, width: 100, height: 100))
//        bottomButton .backgroundColor = .blue
//        scrollView.addSubview(bottomButton)
        
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2200)

    }
    
}
