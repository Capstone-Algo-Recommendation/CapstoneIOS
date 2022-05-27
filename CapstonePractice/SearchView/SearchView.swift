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
    let levelButton = UIButton()
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
        addSubview(levelButton)
        
//        addSubview(vv)
        addSubview(tableView)
        
        levelButton.setTitle("난의도를 설정해주세요", for: .normal)
        levelButton.titleLabel?.textAlignment = .center
        levelButton.setTitleColor(.white, for: .normal)

        backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        tableView.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
//        tableView.backgroundColor = .white
        tableView.register(ProblemTableViewCell.self, forCellReuseIdentifier: ProblemTableViewCell.identifier)
        seachBar.searchTextField.textColor = .white
        seachBar.barTintColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        
    }
    
    
    func setUpConstraints() {
        seachBar.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide)
        }
        
        levelButton.snp.makeConstraints { make in
            make.top.equalTo(seachBar.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        
        
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(levelButton.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
        }
    }
    
    
    
    
}
