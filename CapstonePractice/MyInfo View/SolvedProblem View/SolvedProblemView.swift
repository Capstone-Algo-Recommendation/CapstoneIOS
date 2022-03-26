//
//  SolvedProblemView.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import UIKit
import SnapKit


final class SolvedProblemView: UIView, SetUpView {
 
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
        addSubview(tableView)
        tableView.register(ProblemTableViewCell.self, forCellReuseIdentifier: ProblemTableViewCell.identifier)
    }
    
    func setUpConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}
