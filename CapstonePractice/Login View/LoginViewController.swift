//
//  LoginViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/21.
//

import UIKit
import RxCocoa
import RxSwift
import FirebaseCore
import GoogleSignIn
import Firebase

final class LoginViewController: UIViewController {
    
    let mainView = LoginView()
    let disposeBag = DisposeBag()
    let signInConfig = GIDConfiguration.init(clientID: "591917256191-dci0ftkrmar7n2ja4gsohuhae6l4ng7c.apps.googleusercontent.com")
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.startButton
            .rx.tap
            .bind {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                let vc = MainTabBarController()
                windowScene.windows.first?.rootViewController = vc
                windowScene.windows.first?.makeKeyAndVisible()
                
        }.disposed(by: disposeBag)
        
        
//        mainView.registerButton
//            .rx.tap
//            .bind {
//                let vc = RegisterViewController()
//                self.navigationController?.pushViewController(vc, animated: true)
//            }.dispoxsed(by: disposeBag)
        
        
        mainView.registerButton.addTarget(self, action: #selector(goolgeLogintTapped), for: .touchUpInside)
    
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
    
    
    
    @objc func goolgeLogintTapped() {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            guard let user = user else { return }
            
            user.authentication.do { authentication, error in
                guard error == nil else { return }
                guard let authentication = authentication else { return }

                let idToken = authentication.idToken
                
                print(idToken)
                
                // Send ID token to backend.
                // TODO: LogIn Succeeded. Need Transition.
                // If sign in succeeded, display the app's main content View.
                
                }
          }
    }
}
