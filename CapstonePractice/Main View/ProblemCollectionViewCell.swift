//
//  ProblemCollectionViewCell.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/30.
//

import UIKit
import SnapKit

final class ProblemCollectionViewCell: UICollectionViewCell, SetUpView {
    
    static let identifier = "ProblemCollectionViewCell"
    let problemNumber = UILabel()
    let problemTitle = UILabel()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setUp() {
        contentView.addSubview(problemTitle)
        contentView.addSubview(problemNumber)
//        addSubview(problemNumber)
//        addSubview(problemTitle)
        
        problemNumber.text = "10001"
        problemTitle.text = "hello world tjiss "
//        problemTitle.numberOfLines = 0
    }
    
    func setUpConstraints() {
        

//        problemNumber.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(4)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(50)
//            make.height.equalTo(20)
//        }
        
        problemTitle.snp.makeConstraints { make in
//            make.top.equalTo(problemNumber.snp.bottom).offset(4)
////            make.height.equalTo(22).priority(500)
//            make.bottom.equalToSuperview().offset(-5)
//            make.leading.equalToSuperview().offset(8)
//            make.trailing.equalToSuperview().offset(-8)
            make.top.equalToSuperview().offset(4)
            
//            make.width.equalTo(50)
//            make.height.equalTo(20)
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
            make.bottom.equalToSuperview().offset(-4)
        }
        
    }
    
    
}
