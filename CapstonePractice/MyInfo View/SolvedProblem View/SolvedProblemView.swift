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
        keyBoardHiddenConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        addSubview(tableView)
        tableView.register(ProblemTableViewCell.self, forCellReuseIdentifier: ProblemTableViewCell.identifier)
        tableView.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
    }
    
    func keyBoardHiddenConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
    }
    
    
}
