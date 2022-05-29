//
//  PosterTableViewCell.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import SnapKit

class PosterTableViewCell: UITableViewCell, SetUpView {
    
    static let identifier = "PosterTableViewCell"
    
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    let dateIdLabel = UILabel()
    
    let likeLabel = UILabel()
    
    
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
        addSubview(contentLabel)
        addSubview(dateIdLabel)
        addSubview(likeLabel)
        backgroundColor = UIColor(red: 43/255, green: 50/255, blue: 71/255, alpha: 1)
        
        titleLabel.text = "This is title"
        titleLabel.textColor = .white
        contentLabel.text = "this is content of this poster"
        dateIdLabel.text = "03.24"
        likeLabel.text = "👍 5 💬 3"
        
        titleLabel.font = .systemFont(ofSize: 20)
        contentLabel.font = .systemFont(ofSize: 15)
        dateIdLabel.font = .systemFont(ofSize: 15)
        likeLabel.font = .systemFont(ofSize: 15)
        
        contentLabel.textColor = .gray
        dateIdLabel.textColor = .gray
        likeLabel.textColor = .gray
        
        likeLabel.textAlignment = .right
        likeLabel.isHidden = true
        
        
        
    }
    
    func keyBoardHiddenConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.height.equalTo(25)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.height.equalTo(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        dateIdLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(5)
            make.height.equalTo(15)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(100)
        }
        
        likeLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(5)
            make.height.equalTo(15)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(100)
        }
    }
    
    
}

