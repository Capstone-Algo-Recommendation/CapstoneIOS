//
//  ProblemTableViewCell.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import UIKit
import SnapKit

final class ProblemTableViewCell: UITableViewCell, SetUpView {
    
    static let identifier = "ProblemTableViewCell"
    
    let titleLabel = UILabel()
    let numberLabel = UILabel()
    let keyLabel = UILabel()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        setUpConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        addSubview(titleLabel)
        addSubview(numberLabel)
        addSubview(keyLabel)
    }
    
    func setUpConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    
}
