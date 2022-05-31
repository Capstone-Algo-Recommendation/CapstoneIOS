//
//  BackJoonInfoView.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/04/28.
//

import UIKit
import SnapKit

final class BackJoonInfoView: UIView, SetUpView {

    let baseView = UIView()
    let titleLabel = UILabel()
    let backJoonIdInfo = UILabel()
    let backJoonIdTextField = UITextField()
    let nickNameInfo = UILabel()
    let nickNameTextField = UITextField()
    
    let containerView = UIView()
    let passButton = UIButton()
    
    let infoLabel = UILabel()
    
    
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
        addSubview(baseView)
//        baseView.
        baseView.addSubview(containerView)

        baseView.addSubview(infoLabel)
        baseView.addSubview(titleLabel)
        
        infoLabel.text = "백준 아이디를 입력하지 않거나 푼 문제가 15 문제 이하면 기초 문제가 추천됩니다."
        infoLabel.font = UIFont(name: FontNames.medium, size: 18)
        infoLabel.textColor = .systemRed
        infoLabel.numberOfLines = 0
        
        titleLabel.text = "회원가입"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: FontNames.medium, size: 24)

        containerView.layer.cornerRadius = 20
        
        containerView.addSubview(backJoonIdInfo)
        containerView.addSubview(backJoonIdTextField)
        containerView.addSubview(nickNameInfo)
        containerView.addSubview(nickNameTextField)
        
        backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        baseView.addSubview(confirmButton)
        confirmButton.backgroundColor = .orange
        baseView.addSubview(passButton)
        passButton.backgroundColor = .gray
        
        passButton.setTitle("건너뛰기", for: .normal)
        passButton.setTitleColor(.white, for: .normal)
        
        containerView.backgroundColor = .systemMint
//        backgroundColor = .white
        
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
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.layer.cornerRadius = 20
        passButton.layer.cornerRadius = 20
        
    }
    
    
    func keyBoardHiddenConstraints() {
        baseView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(60)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            
            make.height.equalTo(200)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(100)
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
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-60)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        }
        
        passButton.snp.makeConstraints { make in
            make.top.equalTo(confirmButton.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        }
        
    }
}
