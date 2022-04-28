//
//  BackJoonInfoView.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/04/28.
//

import UIKit
import SnapKit

final class BackJoonInfoView: UIView, SetUpView {

    let backJoonIdInfo = UILabel()
    let backJoonIdTextField = UITextField()
    let nickNameInfo = UILabel()
    let nickNameTextField = UITextField()
    let containerView = UIView()
    let confirmButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        keyBoardHiddenConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        addSubview(containerView)
        containerView.layer.cornerRadius = 20
        
        containerView.addSubview(backJoonIdInfo)
        containerView.addSubview(backJoonIdTextField)
        containerView.addSubview(nickNameInfo)
        containerView.addSubview(nickNameTextField)
        containerView.addSubview(confirmButton)
        
        
        containerView.backgroundColor = .systemMint
        backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        backJoonIdInfo.text = "백준 아이디를 입력해 주세요"
        backJoonIdInfo.textColor = .gray
        
        backJoonIdInfo.font = .systemFont(ofSize: 16)
        backJoonIdTextField.placeholder = "백준 아이디 입력"
        backJoonIdTextField.font = .systemFont(ofSize: 21)
        
        nickNameInfo.text = "닉네임을 정해주세요"
        nickNameInfo.textColor = .gray
        nickNameInfo.font = .systemFont(ofSize: 15)
        nickNameTextField.placeholder = "닉네임 입력"
        nickNameTextField.font = .systemFont(ofSize: 20)
        
        confirmButton.setTitle("확인", for: .normal)
        confirmButton.setTitleColor(.blue, for: .normal)
        
    }
    
    
    func keyBoardHiddenConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.centerY).offset(-200)
            make.centerX.equalTo(self.snp.centerX)
            make.height.equalTo(200)
            make.width.equalTo(300)
        }
        
        backJoonIdInfo.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.height.equalTo(15)
        }
        
        backJoonIdTextField.snp.makeConstraints { make in
            make.top.equalTo(backJoonIdInfo.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.height.equalTo(35)
        }
        
        nickNameInfo.snp.makeConstraints { make in
            make.top.equalTo(backJoonIdTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.height.equalTo(15)
        }
        
        nickNameTextField.snp.makeConstraints { make in
            make.top.equalTo(nickNameInfo.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(10)
            make.height.equalTo(35)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(nickNameTextField.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(50)
        }
        
    }
}
