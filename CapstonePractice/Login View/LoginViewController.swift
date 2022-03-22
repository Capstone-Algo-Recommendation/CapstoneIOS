//
//  LoginViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/21.
//

import UIKit
import RxCocoa
import RxSwift

final class LoginViewController: UIViewController {
    
    let mainView = LoginView()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.startButton
            .rx.tap
            .bind {
            print("startButton clciked")
        }.disposed(by: disposeBag)
        
        
        mainView.registerButton
            .rx.tap
            .bind {
                let vc = RegisterViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }.disposed(by: disposeBag)
    
        mainView.idTextField
            .rx.value
            .subscribe { text in
                print(text!)
            }.disposed(by: disposeBag)
        
        mainView.idTextField
            .rx.controlEvent([.editingDidEnd])
            .bind { text in
                print(text, " from end")
            }.disposed(by: disposeBag)
        
        
        mainView.passWordTextField
            .rx.value
            .subscribe { text in
                print("pass \(text)")
            }.disposed(by: disposeBag)
        
    }
    
    
}
