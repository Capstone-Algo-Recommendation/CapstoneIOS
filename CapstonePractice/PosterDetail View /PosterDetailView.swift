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
        tableView.register(PosterDetailMainCell.self, forCellReuseIdentifier: PosterDetailMainCell.identifier)
        tableView.register(PosterDetailCommentCell.self, forCellReuseIdentifier: PosterDetailCommentCell.identeifier)
    }
    
    func setUpConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
