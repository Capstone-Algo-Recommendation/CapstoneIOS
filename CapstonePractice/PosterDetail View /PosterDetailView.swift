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
    let sendButton = UIButton()
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
        commentSuperView.addSubview(sendButton)
        
        commentSuperView.backgroundColor = .black
        
        sendButton.backgroundColor = .yellow
        tableView.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        tableView.allowsSelection = false
        tableView.keyboardDismissMode = .onDrag
        
        commentTextView.layer.cornerRadius = 20
        
        commentTextView.backgroundColor = .gray
        tableView.register(PosterDetailMainCell.self, forCellReuseIdentifier: PosterDetailMainCell.identifier)
        tableView.register(PosterDetailCommentCell.self, forCellReuseIdentifier: PosterDetailCommentCell.identeifier)
    }
    
    func keyBoardShowConstraints(keyBoardHeight: CGFloat) {
        tableView.snp.removeConstraints()
        commentTextView.snp.removeConstraints()
        sendButton.snp.removeConstraints()
        commentSuperView.snp.removeConstraints()
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(commentSuperView.snp.top)
        }
        
        commentTextView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-65)
            make.leading.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(3)
            make.height.equalTo(40)
            
        }
        
        sendButton.snp.makeConstraints { make in
            make.leading.equalTo(commentTextView.snp.trailing).offset(8).priority(750)
            make.trailing.equalTo(commentSuperView.snp.trailing).offset(-25)
            make.top.equalTo(commentSuperView.snp.top).offset(3)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        commentSuperView.snp.makeConstraints { make in
            make.height.equalTo(65 + keyBoardHeight)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func keyBoardHiddenConstraints() {
        sendButton.snp.removeConstraints()
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
            make.trailing.equalToSuperview().offset(-65)
            make.leading.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(3)
            make.height.equalTo(40)
        }
        
        sendButton.snp.makeConstraints { make in
            make.leading.equalTo(commentTextView.snp.trailing).offset(8).priority(750)
            make.trailing.equalTo(commentSuperView.snp.trailing).offset(-25)
            make.top.equalTo(commentSuperView.snp.top).offset(3)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        commentSuperView.snp.makeConstraints { make in
            make.height.equalTo(65)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
