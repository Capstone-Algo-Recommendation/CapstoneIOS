//
//  ProbleCellLikeView.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/04/30.
//

import UIKit

class ProbleCellLikeView: UIControl, SetUpView {
    
    let problemNumLabel = UILabel()
    let problemTitleLabel = UILabel()
    let problemTypeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        keyBoardHiddenConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        backgroundColor = .green
        addSubview(problemNumLabel)
        addSubview(problemTypeLabel)
        addSubview(problemTitleLabel)
    }
    
    func keyBoardHiddenConstraints() {
        problemNumLabel.snp.makeConstraints { make in
            
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(25)
        }
        
        problemTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(problemNumLabel.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.trailing.equalToSuperview()
        }
        
        problemTypeLabel.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.trailing.equalToSuperview().offset(-12)
        }
    }
    
}
