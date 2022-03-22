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
    let disposBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLayoutSubviews() {
        // UILabel 왼쪽 위부터 시작하게 하는 기능.
        mainView.backJoonInfoLabel.sizeToFit()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "회원가입"
        
        mainView.idTextField
            .rx.text.bind { text in
                guard let text = text else { return }
                print(text,"from txt")
            }.disposed(by: disposBag)
        
        
        mainView.idTextField
            .rx.value.bind { text in
                print(text)
            }.disposed(by: disposBag)
        
        
        mainView.firstPassTextField
            .rx.value.bind { text in
                print(text)
            }.disposed(by: disposBag)
        
        
        
        mainView.secondPassTextField
            .rx.value.bind { text in
                print(text)
            }.disposed(by: disposBag)
        
        
        
        mainView.backJoonIdTextField
            .rx.value.bind { text in
                print(text)
            }.disposed(by: disposBag)
        
        
        mainView.nextButton
            .rx.tap
            .bind {
                print("회원가입 버튼 눌림")
            }
            .disposed(by: disposBag)
    }
    
   
}
