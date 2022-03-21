//
//  LoginView.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/21.
//

import UIKit
import SnapKit

final class LoginView: UIView {
    
    let logoLabel = UILabel()
    let idTextField = UITextField()
    let passWordTextField = UITextField()
    let startButton = UIButton()
    let registerButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUp() {
        backgroundColor = .white
        addSubview(logoLabel)
        
        addSubview(idTextField)
        addSubview(passWordTextField)
        
        addSubview(startButton)
        addSubview(registerButton)
        
        
        logoLabel.textAlignment = .center
        logoLabel.text = "백준 추천 App"
        
        idTextField.placeholder = "아이디를 입력해주세요"
        passWordTextField.placeholder = "비밀번호를 입력해주세요"
        
        startButton.setTitle("시작하기", for: .normal)
        registerButton.setTitle("회원가입하기", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        
    }
    
    private func setUpConstraints() {
        
        logoLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(70)
            make.width.equalTo(250)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(45)
            make.width.equalTo(250)
        }
        
        passWordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(45)
            make.width.equalTo(250)
        }
        
        registerButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-30)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(250)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(registerButton.snp.top).offset(-30)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(250)
        }
        
    }
    
}
