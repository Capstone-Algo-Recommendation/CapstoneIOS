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
//                let vc = MainTabBarController()
                let vc = RegisterViewController()
//                let vc = UINavigationController(rootViewController: SeachViewController())
                
                windowScene.windows.first?.rootViewController = vc
                windowScene.windows.first?.makeKeyAndVisible()
                
        }.disposed(by: disposeBag)
        
        

        
        mainView.registerButton.addTarget(self, action: #selector(goolgeLogintTapped), for: .touchUpInside)
    }
    
    
    
    @objc func goolgeLogintTapped() {

        
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            guard let user = user else { return }

            user.authentication.do { authentication, error in
                guard error == nil else { return }
                guard let authentication = authentication else { return }
                
                ApiService.login(access_token: authentication.accessToken, refresh_token: authentication.refreshToken) { token, role in
                    
                    UserDefaults.standard.set(token, forKey: StaticMembers.userToken)
                    
                    if role == "ROLE_MEMBER" {
                        DispatchQueue.main.async {
                            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                            let vc = MainTabBarController()
                            
                            
                            ApiService.getMyInfo {
                            
                                DispatchQueue.main.async {
                                    print("hello worldf")
                                }
                            }
                            
                            windowScene.windows.first?.rootViewController = vc
                            windowScene.windows.first?.makeKeyAndVisible()
                        }
                    } else {
                        DispatchQueue.main.async {
                            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }

                            let vc = RegisterViewController()
                            
                            windowScene.windows.first?.rootViewController = vc
                            windowScene.windows.first?.makeKeyAndVisible()
                        }
                        
                    }
                     
                }

            }
            
            
        }
    }
}

