//
//  PosterDetailView.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import SnapKit

class PosterDetailView: UIView, SetUpView {
    
    let tableView = UITableView()
    var open = true
    
    let commentSuperView = UIView()
    let commentTextView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        keyBoardHiddenConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        addSubview(tableView)
        
        commentSuperView.addSubview(commentTextView)
        addSubview(commentSuperView)
        
        commentTextView.layer.cornerRadius = 20
        
        commentSuperView.backgroundColor = .white
        
        commentTextView.backgroundColor = .gray
        tableView.register(PosterDetailMainCell.self, forCellReuseIdentifier: PosterDetailMainCell.identifier)
        tableView.register(PosterDetailCommentCell.self, forCellReuseIdentifier: PosterDetailCommentCell.identeifier)
    }
    
    func keyBoardShowConstraints(keyBoardHeight: CGFloat) {
        tableView.snp.removeConstraints()
        commentTextView.snp.removeConstraints()
        commentSuperView.snp.removeConstraints()
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(commentSuperView.snp.top)
        }
        
        commentTextView.snp.makeConstraints { make in
            make.trailing.equalTo(commentSuperView.snp.trailing).offset(-25)
            make.leading.equalTo(commentSuperView.snp.leading).offset(25)
            make.top.equalTo(commentSuperView.snp.top).offset(3)
            make.height.equalTo(40)
        }
        
        commentSuperView.snp.makeConstraints { make in
            make.height.equalTo(65 + keyBoardHeight)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func keyBoardHiddenConstraints() {
        
        tableView.snp.removeConstraints()
        commentTextView.snp.removeConstraints()
        commentSuperView.snp.removeConstraints()
    
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(commentSuperView.snp.top)
        }
        
        commentTextView.snp.makeConstraints { make in
            make.trailing.equalTo(commentSuperView.snp.trailing).offset(-25)
            make.leading.equalTo(commentSuperView.snp.leading).offset(25)
            make.top.equalTo(commentSuperView.snp.top).offset(3)
            make.height.equalTo(40)
        }
        
        commentSuperView.snp.makeConstraints { make in
            make.height.equalTo(65)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
