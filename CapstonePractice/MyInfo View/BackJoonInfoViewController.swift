//
//  BackJoonInfoViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/04/28.
//

import UIKit
import RxSwift
import RxCocoa


final class BackJoonInfoViewController: UIViewController {
    
    let mainView = BackJoonInfoView()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.confirmButton.rx.tap.bind { _ in
            self.dismiss(animated: true)
        }
    }

}
