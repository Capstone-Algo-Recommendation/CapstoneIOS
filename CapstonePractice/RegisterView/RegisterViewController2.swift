//
//  RegisterViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/05/20.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class RegisterViewController: UIViewController {
    
    let mainView = BackJoonInfoView()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.confirmButton.rx
            .tap.bind { _ in
                if let bck = self.mainView.backJoonIdTextField.text, let name = self.mainView.nickNameTextField.text {
                    
                    UserDefaults.standard.set(bck, forKey: "bck")
                    
//                    if bck.count == 0 {
//                        UserDefaults.standard.set(" ", forKey: "bck")
//                    }
                    
                    print(bck, "what is. back joon id", name, "what is name?")
                    
                    ApiService.meInit(bojId: bck, name: name) {
                        DispatchQueue.main.async {
                            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                            let vc = MainTabBarController()
                            windowScene.windows.first?.rootViewController = vc
                            windowScene.windows.first?.makeKeyAndVisible()
                        }
                    }
                }else {
                    print("not good")
                }
                
            }.disposed(by: disposeBag)
        
        
        mainView.passButton.rx
            .tap.bind { _ in
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                let vc = MainTabBarController()
                windowScene.windows.first?.rootViewController = vc
                windowScene.windows.first?.makeKeyAndVisible()
                
            }.disposed(by: disposeBag)
        
        mainView.baseView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: "someAction:")
        mainView.baseView.addGestureRecognizer(gesture)
    
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer){
        view.endEditing(true)
    }
    
}
