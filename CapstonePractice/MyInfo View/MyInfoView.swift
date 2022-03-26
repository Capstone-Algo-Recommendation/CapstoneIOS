//
//  MyInfoView.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import UIKit
import SnapKit


class MyInfoView: UIView, SetUpView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        backgroundColor = .systemMint
        addSubview(tableView)
        tableView.register(MyInfoTableViewCell.self, forCellReuseIdentifier: MyInfoTableViewCell.identifier)
    }
    
    func setUpConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
