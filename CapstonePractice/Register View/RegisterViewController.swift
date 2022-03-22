//
//  RegisterViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/21.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {
    
    let mainView = RegisterView()
    
    override func loadView() {
        self.view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        // UILabel 왼쪽 위부터 시작하게 하는 기능.
        mainView.backJoonInfoLabel.sizeToFit()
    }
    
}
