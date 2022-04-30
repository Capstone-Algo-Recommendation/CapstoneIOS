//
//  MainViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    

    var scrollView = UIScrollView()
    
    let firstProblem = ProbleCellLikeView()
    let secondProblem = ProbleCellLikeView()
    let thirdProblem = ProbleCellLikeView()
    
    let topRecommendView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "문제 풀어요~"
    }
    
  
    
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setUp()
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        
        topRecommendView.frame = CGRect(x: 20, y: 20, width: view.frame.width, height: 200)
        
        // 고정
        firstProblem.problemNumLabel.text = "1"
        secondProblem.problemNumLabel.text = "2"
        thirdProblem.problemNumLabel.text = "3"
        
        // 바꿔야 할것들
        firstProblem.problemTypeLabel.text = "dp"
        firstProblem.problemTitleLabel.text = "피보나치 수열"
        
        
        secondProblem.problemTitleLabel.text = "길찾기"
        secondProblem.problemTypeLabel.text = "bfs"
        
        
        thirdProblem.problemTitleLabel.text = "이렇게 저렇게 하는 거"
        thirdProblem.problemTypeLabel.text = "data structure"
        
    
        setUpConstraints()

    }
    
}

// UIs

extension MainViewController {
    private func setUp() {
        
        scrollView.backgroundColor = .brown
        view.addSubview(scrollView)
        topRecommendView.addSubview(firstProblem)
        topRecommendView.addSubview(secondProblem)
        topRecommendView.addSubview(thirdProblem)
        
        scrollView.addSubview(topRecommendView)
        
        firstProblem.addTarget(self, action: #selector(topTapped), for: .touchUpInside)
        firstProblem.isUserInteractionEnabled = true
        
        secondProblem.addTarget(self, action: #selector(topTapped), for: .touchUpInside)
        secondProblem.isUserInteractionEnabled = true
        
        thirdProblem.addTarget(self, action: #selector(topTapped), for: .touchUpInside)
        thirdProblem.isUserInteractionEnabled = true
    }
    
    private func setUpConstraints() {
        scrollView.contentSize = CGSize(width: view.frame.width - 20, height: 2200)
        
        firstProblem.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(self.view.snp.leading).offset(20)
            make.trailing.equalTo(self.view.snp.trailing).offset(-20)
            make.height.equalTo(35)
        }
        secondProblem.snp.makeConstraints { make in
            make.top.equalTo(firstProblem.snp.bottom).offset(15)
            make.leading.equalTo(self.view.snp.leading).offset(20)
            make.trailing.equalTo(self.view.snp.trailing).offset(-20)
            make.height.equalTo(35)
        }
        thirdProblem.snp.makeConstraints { make in
            make.top.equalTo(secondProblem.snp.bottom).offset(15)
            make.leading.equalTo(self.view.snp.leading).offset(20)
            make.trailing.equalTo(self.view.snp.trailing).offset(-20)
            make.height.equalTo(35)
        }
        
    }
}

// addTargets
extension MainViewController {
    
    @objc func topTapped() {
        print("Heelo")
    }
    
}


