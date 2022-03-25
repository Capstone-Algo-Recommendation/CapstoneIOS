//
//  PosterDetailCommentCell.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import SnapKit

final class PosterDetailCommentCell: UITableViewCell, SetUpView {
    
    static let identeifier = "PosterDetailCommentCell"
    
    let userIdLabel = UILabel()
    let contentLablel = UILabel()
    let createdLabel = UILabel()
    let likeButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        addSubview(userIdLabel)
        addSubview(contentLablel)
        addSubview(createdLabel)
        addSubview(likeButton)
        
        userIdLabel.font = .systemFont(ofSize: 20)
        createdLabel.font = .systemFont(ofSize: 15)
        contentLablel.font = .systemFont(ofSize: 17)
        
        userIdLabel.text = "Yundong"
        createdLabel.text = "2017/01/12"
        contentLablel.text = "안녕하세요"
        
    }
    
    func setUpConstraints() {
        userIdLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(25)
        }
        
        contentLablel.snp.makeConstraints { make in
            make.top.equalTo(userIdLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        createdLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLablel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(15)
        }
        
    }
    
}
