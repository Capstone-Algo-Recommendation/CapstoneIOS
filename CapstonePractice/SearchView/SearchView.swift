//
//  SearchView.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/05/20.
//

import Foundation
import UIKit
import SnapKit


class SearchView: UIView {
    
    let seachBar = UISearchBar()
    let tableView = UITableView()
    let vv = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setUp() {
        addSubview(seachBar)
        
//        addSubview(vv)
        addSubview(tableView)

        backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        tableView.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
//        tableView.backgroundColor = .white
        tableView.register(ProblemTableViewCell.self, forCellReuseIdentifier: ProblemTableViewCell.identifier)
        
    }
    
    
    func setUpConstraints() {
        seachBar.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide)
        }
        
        
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(seachBar.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    
    
    
    
}
