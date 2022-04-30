//
//  File.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/30.
//

import UIKit
import SnapKit

class MainView: UIView, SetUpView {
    
    let scrollView = UIScrollView()
    
    let containerView = UIView()

    let firstProblem = ProbleCellLikeView()
    let secondProblem = ProbleCellLikeView()
    let thirdProblem = ProbleCellLikeView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        keyBoardHiddenConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    func setUp() {
        
        backgroundColor = .white
        
        scrollView.backgroundColor = .gray

        addSubview(scrollView)
        
        scrollView.addSubview(firstProblem)
        scrollView.addSubview(secondProblem)
        scrollView.addSubview(thirdProblem)
        
 
        
        firstProblem.problemTitleLabel.text = "hello worlasdasdadd"
        
        secondProblem.problemTitleLabel.text = "this is my"
        
        thirdProblem.problemTitleLabel.text = "bebecucu"
    }
    
    
    func keyBoardHiddenConstraints() {
        
//        scrollView.contentSize = CGSize(width: self.bounds.width, height: 2200)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        
        firstProblem.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(35)
        }
        
        secondProblem.snp.makeConstraints { make in
            make.top.equalTo(firstProblem.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(35)
        }
        
        thirdProblem.snp.makeConstraints { make in
            make.top.equalTo(secondProblem.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(35)
        }


    }

}
