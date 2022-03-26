//
//  WritePostViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import UIKit

class WritePostViewController: UIViewController {
    
    let mainView = WritePosterView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "글 쓰기"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "close_small"), style: .plain, target: self, action: #selector(closeButtonClcked))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "check"), style: .plain, target: self, action: #selector(postButtonClicked))
    }
    
    @objc func closeButtonClcked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func postButtonClicked() {
        print("need to post")
    }
    
    
    
    
}
