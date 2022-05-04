//
//  PosterDetailMainCell.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import SnapKit

final class PosterDetailMainCell: UITableViewCell, SetUpView {

    
    static let identifier = "PosterDetailMainCell"
    
    let authorLabel = UILabel()
    let createdDateLabel = UILabel()
    let posterTitleLabel = UILabel()
    let posterContentLabel = UILabel()
    let likeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        keyBoardHiddenConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        addSubview(authorLabel)
        addSubview(createdDateLabel)
        addSubview(posterTitleLabel)
        addSubview(posterContentLabel)
        addSubview(likeLabel)
        
        backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        
        
        authorLabel.textColor = .white
        createdDateLabel.textColor = .white
        posterTitleLabel.textColor = .white
        likeLabel.textColor = .white
        posterContentLabel.textColor = .white
        
        authorLabel.text = "unknown author"
        authorLabel.font = .systemFont(ofSize: 15)
        createdDateLabel.text = "2017/01/11"
        createdDateLabel.font = .systemFont(ofSize: 15)
        posterTitleLabel.text = "some title be here"
        posterTitleLabel.font = .boldSystemFont(ofSize: 22)
        likeLabel.text = "5 likes"
        likeLabel.font = .systemFont(ofSize: 15)
        posterContentLabel.text = "aa fakdsmf kmsdakmfkmd skfmk mfklamsdk fmkdsm fkmdkm kdsmfk mdksmf kdm fkmsdak mfkasdm kfm ksdmfkm dskf mkldm dsfkjn djfnsdj nfjndsj nfjn sjdnf jnsdjf njd nfjnd jsfn jsdnf jsdn fjsdn fjsdn fjsdnfjn jsdfnjsdnjf kldsmfklsdm fkmd kfmadsk flm"
        posterContentLabel.numberOfLines = 0
    }
    
    func keyBoardHiddenConstraints() {
        authorLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(15)
        }
        
        createdDateLabel.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(15)
        }
        
        posterTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(createdDateLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(25)
        }
        
        posterContentLabel.snp.makeConstraints { make in
            make.top.equalTo(posterTitleLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            
        }
        
        likeLabel.snp.makeConstraints { make in
            make.top.equalTo(posterContentLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(15)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        
        
    }
    
    
    
}
