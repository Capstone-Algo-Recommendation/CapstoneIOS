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
        
        let mainVC = MainViewController()
        let posterVC = PostBoardViewController()
        let myInfoVC = MyInfoViewController()
        
        view.backgroundColor = .white
        
        mainVC.tabBarItem.title = "홈"
        posterVC.tabBarItem.title = "게시판"
        myInfoVC.tabBarItem.title = "내 정보"
        
        
        viewControllers = [mainVC, posterVC, myInfoVC]
    }
    
    
}
