//
//  MyInfoTableViewCell.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import UIKit
import SnapKit

final class MyInfoTableViewCell: UITableViewCell, SetUpView {

    static let identifier = "MyInfoTableViewCell"
    
    let menuImage = UIImageView()
    let menuTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        keyBoardHiddenConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setUp() {
        addSubview(menuImage)
        addSubview(menuTitle)
        menuTitle.font = .systemFont(ofSize: 18)
    }
    
    func keyBoardHiddenConstraints() {
        
        menuImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(menuImage.snp.height)
        }
        
        menuTitle.snp.makeConstraints { make in
            make.leading.equalTo(menuImage.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(30)
        }
    }
    
    
}
