//
//  PosterView.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import SnapKit

class PosterView: UIView, SetUpView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        keyBoardHiddenConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    internal func setUp() {
        backgroundColor = .white
        addSubview(tableView)
        tableView.register(PosterTableViewCell.self, forCellReuseIdentifier: PosterTableViewCell.identifier)
    }
    
    internal func keyBoardHiddenConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
