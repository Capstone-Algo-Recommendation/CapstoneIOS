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
    
    let pickerViewContainer = UIView()
    var pickerView = UIPickerView()
    
    let seachBar = UISearchBar()
    let levelButton = UIButton()
    let tableView = UITableView()
    let categotySelectionButton = UIButton()
    
    let selectedKeyWordsLabel = UILabel()
    let searchButton = UIButton()

    
    let seperatorView = UIView()
    
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
        addSubview(categotySelectionButton)
        addSubview(searchButton)
        addSubview(selectedKeyWordsLabel)
        
        addSubview(seperatorView)
        seperatorView.backgroundColor = .lightGray
        categotySelectionButton.layer.cornerRadius = 15
        
        selectedKeyWordsLabel.text = "검색 키워드"
        selectedKeyWordsLabel.textColor = .white
        
        searchButton.setTitle("검색", for: .normal)
        searchButton.setTitleColor(.white, for: .normal)
        
        pickerViewContainer.backgroundColor = .red
        categotySelectionButton.setTitle("검색을 하려면 눌러주세요", for: .normal)
        categotySelectionButton.setTitleColor(.white, for: .normal)
        categotySelectionButton.backgroundColor = .systemOrange
        addSubview(tableView)
        
        levelButton.setTitle("난이도를 설정해주세요", for: .normal)
        levelButton.titleLabel?.textAlignment = .center
        levelButton.setTitleColor(.white, for: .normal)

        backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        tableView.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
//        tableView.backgroundColor = .white
        tableView.register(ProblemTableViewCell.self, forCellReuseIdentifier: ProblemTableViewCell.identifier)
        seachBar.searchTextField.textColor = .white
        seachBar.barTintColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        addSubview(pickerViewContainer)
        pickerViewContainer.addSubview(pickerView)
        pickerViewContainer.isHidden = true
        
        selectedKeyWordsLabel.layer.cornerRadius = 15
        selectedKeyWordsLabel.backgroundColor = .lightGray
        
        searchButton.layer.cornerRadius = 10
        searchButton.backgroundColor = .orange

    }
    
    
    func setUpConstraints() {
        categotySelectionButton.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide)
        }
        
        
        selectedKeyWordsLabel.snp.makeConstraints { make in
            make.top.equalTo(categotySelectionButton.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
    
            make.height.equalTo(40)
            make.trailing.equalTo(searchButton.snp.leading).offset(-10)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(categotySelectionButton.snp.bottom).offset(5)
//            make.leading.equalTo(selectedKeyWordsLabel.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(50)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        
        seperatorView.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
        }
        
        
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(seperatorView.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
        }
        
        pickerViewContainer.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-18)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        pickerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    
    
}
