//
//  MainTabBarController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVC = UINavigationController(rootViewController: MainViewController())
        let posterVC = UINavigationController(rootViewController: PostBoardViewController())
        let myInfoVC = UINavigationController(rootViewController: MyInfoViewController())
        
        view.backgroundColor = .white
        
        mainVC.tabBarItem.title = "홈"
        posterVC.tabBarItem.title = "게시판"
        myInfoVC.tabBarItem.title = "내 정보"
        
        viewControllers = [mainVC, posterVC, myInfoVC]
    }
}
