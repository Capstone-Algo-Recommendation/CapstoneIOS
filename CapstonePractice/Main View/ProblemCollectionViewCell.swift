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
    let problemType = UILabel()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        keyBoardHiddenConstraints()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        problemTitle.sizeToFit()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setUp() {
        contentView.addSubview(problemTitle)
        contentView.addSubview(problemNumber)
        contentView.addSubview(problemType)

        problemNumber.text = "10001"
        problemNumber.font = .systemFont(ofSize: 14)
        problemTitle.text = "hello world tjiss "
        problemType.numberOfLines = 0
        problemTitle.numberOfLines = 0
        problemTitle.textAlignment = .natural
        problemType.textColor = .white
        problemType.font = .systemFont(ofSize: 12)
        self.layer.cornerRadius = 10
    }
    
    func keyBoardHiddenConstraints() {
        
        problemNumber.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview()
            make.height.equalTo(10)
        }
        
        problemTitle.snp.makeConstraints { make in
            make.top.equalTo(problemNumber.snp.bottom).offset(-10)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-4)
            make.bottom.equalToSuperview().offset(-4)
        }
        
        problemType.snp.makeConstraints { make in
            make.top.equalTo(problemTitle.snp.bottom).offset(-20)
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
            make.bottom.equalToSuperview().offset(-2)
        }
        
    }
    
    
}
