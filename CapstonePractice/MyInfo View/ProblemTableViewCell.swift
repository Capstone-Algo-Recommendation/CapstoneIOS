//
//  ProblemTableViewCell.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import UIKit
import SnapKit

final class ProblemTableViewCell: UITableViewCell, SetUpView {
    
    static let identifier = "ProblemTableViewCell"
    
    let titleLabel = UILabel()
    let numberLabel = UILabel()
    let keyLabel = UILabel()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        keyBoardHiddenConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        addSubview(titleLabel)
        addSubview(numberLabel)
        addSubview(keyLabel)
        
        keyLabel.textAlignment = .right
        
        numberLabel.font = .systemFont(ofSize: 16)
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        numberLabel.textColor = .gray
        
    }
    
    func keyBoardHiddenConstraints() {
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(numberLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(30)
            make.trailing.equalToSuperview().offset(-150)
        }
        
        keyLabel.snp.makeConstraints { make in
            make.top.equalTo(numberLabel.snp.bottom).offset(5)
            make.centerY.equalTo(titleLabel)
            make.trailing.equalToSuperview().offset(-5)
            make.width.equalTo(150)
        }
    }
    
    
    
}
