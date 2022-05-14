//
//  SpecificProblemView.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/28.
//

import UIKit
import SnapKit

final class SpecificProblemView: UIView, SetUpView {
    
    let problemTitle = UILabel()
    let closeButton = UIButton()
    
    let rankImage = UIImageView()
    
    let problemInfoLabel = UILabel()
    
    
    let problemLinkLabel = UILabel()
    let problemLinkButton = UIButton()
    
    let problemQuestionLabel = UILabel()
    let problemQuestionButton = UIButton()
    
    
    let memoLabel = UILabel()
    let memoTextView = UITextView()
    let fixLabel = UILabel()
    let fixTextView = UITextView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        keyBoardHiddenConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255, alpha: 1)
        
        addSubview(problemTitle)
        addSubview(closeButton)
        
        
        addSubview(rankImage)
        addSubview(problemInfoLabel)
        addSubview(problemLinkButton)
        addSubview(problemQuestionButton)
        
        addSubview(problemQuestionLabel)
        addSubview(problemLinkLabel)
        
        addSubview(memoLabel)
        addSubview(memoTextView)
        addSubview(fixLabel)
        addSubview(fixTextView)
        setUpUIs()
    }
    
    
    private func setUpUIs() {
        
        
        problemTitle.font = UIFont(name: FontNames.medium, size: 23)
        problemTitle.textColor = .white
        problemTitle.textAlignment = .center
        
        closeButton.setImage(UIImage(named: "closeBig"), for: .normal)
        
        
        problemInfoLabel.text = "산술연산 문제입니다"
        
        
        problemInfoLabel.font = .systemFont(ofSize: 22)
        problemInfoLabel.textColor = .white
        rankImage.image = UIImage(named: "gold3")
        
        
        problemLinkLabel.text = "문제"
        problemLinkLabel.textColor = .white
        problemLinkLabel.textAlignment = .center
        problemLinkLabel.font = .systemFont(ofSize: 21)
        problemLinkButton.setTitle("문제 보기", for: .normal)
        problemQuestionLabel.text = "질문 게시판"
        problemQuestionLabel.textColor = .white
        problemQuestionLabel.font = .systemFont(ofSize: 21)
        problemQuestionLabel.textAlignment = .center
        problemQuestionButton.setTitle("질문 게시판 보기", for: .normal)
        problemLinkButton.setTitleColor(.black, for: .normal)
        problemLinkButton.layer.cornerRadius = 20
        
        
        problemLinkButton.backgroundColor = UIColor(red: 98/255, green: 143/255, blue: 229/255, alpha: 1)
        problemQuestionButton.backgroundColor = UIColor(red: 205/255, green: 244/255, blue: 225/255, alpha: 1)
        problemQuestionButton.setTitleColor(.black, for: .normal)
        problemQuestionButton.layer.cornerRadius = 20
        
        
        memoLabel.textColor = .white
        memoLabel.text = "메모"
        memoLabel.font = .systemFont(ofSize: 23)
        memoTextView.text = "메모를 입력해주세요."
        memoTextView.textColor = .gray
        memoTextView.font = .systemFont(ofSize: 18)
        
        memoTextView.backgroundColor = UIColor(red: 226 / 255, green: 226 / 255, blue: 226 / 255, alpha: 1)
        
        fixLabel.text = "오답 노트"
        fixLabel.textColor = .white
        fixLabel.font = .systemFont(ofSize: 23)
        fixTextView.text = "오답 노트를 입력해주세요."
        fixTextView.textColor = .gray
        fixTextView.font = .systemFont(ofSize: 18)
        fixTextView.backgroundColor = UIColor(red: 226 / 255, green: 226 / 255, blue: 226 / 255, alpha: 1)
        
        
    }
    
    func keyBoardHiddenConstraints() {
        
        problemTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(250)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        closeButton.snp.makeConstraints { make in
            make.leading.equalTo(problemTitle.snp.trailing).offset(15)
            make.centerY.equalTo(problemTitle)
            make.size.equalTo(44)
        }
        
        rankImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalTo(problemTitle.snp.bottom).offset(15)
            make.width.equalTo(45)
            make.height.equalTo(45)
        }
        

        problemInfoLabel.snp.makeConstraints { make in
            make.leading.equalTo(rankImage.snp.trailing).offset(30)
            make.centerY.equalTo(rankImage)
            make.height.equalTo(40)
            make.trailing.equalToSuperview().offset(-15)
        }

        
//        problemLinkLabel.snp.makeConstraints { make in
//            make.top.equalTo(rankImage.snp.bottom).offset(20)
//            make.leading.equalToSuperview().offset(15)
//            make.height.equalTo(40)
//            make.width.equalTo(100)
//        }
        
        
        
        memoLabel.snp.makeConstraints { make in
            make.top.equalTo(rankImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview()
            make.height.equalTo(25)
        }

        memoTextView.snp.makeConstraints { make in
            make.top.equalTo(memoLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(200)
        }


        fixLabel.snp.makeConstraints { make in
            make.top.equalTo(memoTextView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview()
            make.height.equalTo(25)
        }

        fixTextView.snp.makeConstraints { make in
            make.top.equalTo(fixLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(200)
        }
        
        
        problemLinkButton.snp.makeConstraints { make in
//            make.leading.equalTo(problemLinkLabel.snp.trailing).offset(15)
            make.top.equalTo(fixTextView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
//        problemQuestionButton.snp.makeConstraints { make in
//            make.leading.equalTo(problemQuestionLabel.snp.trailing).offset(15)
//            make.top.equalTo(problemLinkButton.snp.bottom)
//            make.width.equalTo(150)
//            make.height.equalTo(40)
//        }
//

        
        
//        problemQuestionLabel.snp.makeConstraints { make in
//            make.top.equalTo(problemLinkLabel.snp.bottom).offset(10)
//            make.leading.equalToSuperview().offset(15)
//            make.height.equalTo(40)
//            make.width.equalTo(100)
//        }
//




        
    }
}
