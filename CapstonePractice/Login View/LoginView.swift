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
    
    
    let idHelpLabel = UILabel()
    let idTextField = UITextField()
    
    let passwordHelpLabel = UILabel()
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
        
        addSubview(idHelpLabel)
        addSubview(passwordHelpLabel)
        
        idHelpLabel.text = "아이디"
        passwordHelpLabel.text = "비밀번호"
        
        
        
        logoLabel.textAlignment = .center
        logoLabel.font = .systemFont(ofSize: 25)
        logoLabel.text = "백준 추천 App"
        
        idTextField.placeholder = "  아이디를 입력해주세요"
        passWordTextField.placeholder = "  비밀번호를 입력해주세요"
        
        startButton.setTitle("시작하기", for: .normal)
        registerButton.setTitle("회원 가입", for: .normal)
        
        idTextField.layer.borderColor = UIColor.lightGray.cgColor
        idTextField.layer.borderWidth = 1
        
        passWordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passWordTextField.layer.borderWidth = 1
//        idTextField.font = .systemFont(ofSize: 14)
        
        idTextField.font = .systemFont(ofSize: 14)
        passWordTextField.font = .systemFont(ofSize: 14)
        
        
        startButton.backgroundColor = .systemOrange
        registerButton.backgroundColor = .lightGray
        startButton.setTitleColor(.white, for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
    }
    
    private func setUpConstraints() {
        
        logoLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(250)

        }
        
        
        idHelpLabel.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(12)
            make.height.equalTo(14)
            make.trailing.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(idHelpLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(40)
        }
        
        passwordHelpLabel.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(14)
        }
        
        passWordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordHelpLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(40)
        }
        
        registerButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-30)
            make.height.equalTo(45)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(registerButton.snp.top).offset(-15)
            make.height.equalTo(45)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
}
