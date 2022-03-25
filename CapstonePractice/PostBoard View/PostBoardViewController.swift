//
//  PostBoardViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import RxSwift
import RxCocoa

class PostBoardViewController: UIViewController {
    
    let mainView = PosterView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello world")
        
    }
    
}
