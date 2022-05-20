//
//  RegisterView.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/21.
//

import UIKit

import SnapKit

class RegisterView2: UIView {
    
    let registerLabel = UILabel()
    
    let idHelpLabel = UILabel()
    let idTextField = UITextField()
    
    
    let firstPassHelpLabel = UILabel()
    let firstPassTextField = UITextField()
    
    let secondPassHelpLabel = UILabel()
    let secondPassTextField = UITextField()
    
    let backJoonTitleLabel = UILabel()
    let backJoonInfoLabel = UILabel()
    let backJoonIdHelpLabel = UILabel()
    let backJoonIdTextField = UITextField()
    
    let nextButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    
    private func setUp() {
        addSubview(registerLabel)
        addSubview(idHelpLabel)
        addSubview(idTextField)
        addSubview(firstPassHelpLabel)
        addSubview(firstPassTextField)
        addSubview(secondPassHelpLabel)
        addSubview(secondPassTextField)
        
        addSubview(backJoonTitleLabel)
        addSubview(backJoonInfoLabel)
        addSubview(backJoonIdHelpLabel)
        addSubview(backJoonIdTextField)
        addSubview(nextButton)
        
        registerLabel.text = "회원정보 입력"
        registerLabel.font = .systemFont(ofSize: 25)
//        registerLabel.textAlignment = .center
        backgroundColor = .white
        idHelpLabel.text = "아이디"
        
        backJoonTitleLabel.text = "백준정보 입력"
        backJoonTitleLabel.font = .systemFont(ofSize: 25)
//        backJoonTitleLabel.textAlignment = .center
        
        
        firstPassHelpLabel.text = "비밀번호"
        firstPassTextField.placeholder = "  비밀번호를 입력해 주세요"
        
        idTextField.font = .systemFont(ofSize: 14)
        firstPassTextField.font = .systemFont(ofSize: 14)
        secondPassTextField.font = .systemFont(ofSize: 14)
        backJoonIdTextField.font = .systemFont(ofSize: 14)
        
        secondPassHelpLabel.text = "비밀번호 재확인"
        secondPassTextField.placeholder = "  비밀번호를 다시한번 입력해 주세요"
        
        
        idTextField.layer.borderColor = UIColor.lightGray.cgColor
        idTextField.layer.borderWidth = 1
        
        firstPassTextField.layer.borderColor = UIColor.lightGray.cgColor
        firstPassTextField.layer.borderWidth = 1
        
        secondPassTextField.layer.borderColor = UIColor.lightGray.cgColor
        secondPassTextField.layer.borderWidth = 1
        
        idTextField.placeholder = "  아이디를 입력해주세요"
        
        backJoonIdHelpLabel.text = "백준 아이디"
        backJoonIdTextField.placeholder = "  백준 아이디를 입력해주세요"
        
    
        backJoonIdTextField.layer.borderColor = UIColor.lightGray.cgColor
        backJoonIdTextField.layer.borderWidth = 1
        
        nextButton.setTitle("가입 완료하기", for: .normal)
        nextButton.backgroundColor = .systemOrange
        
        backJoonInfoLabel.text = "자신이 푼 문제를 백준에서 가져옵니다. 푼 문제를 알 때 더 정확한 문제 추천이 가능해집니다."
        
        backJoonInfoLabel.numberOfLines = 0
        backJoonInfoLabel.sizeToFit()

        
    }
    
    private func setUpConstraints() {
        
        registerLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview()
            make.height.equalTo(30)
            
        }
        
        idHelpLabel.snp.makeConstraints { make in
            make.top.equalTo(registerLabel.snp.bottom).offset(30)
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
        
        firstPassHelpLabel.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(14)
        }
        
        firstPassTextField.snp.makeConstraints { make in
            make.top.equalTo(firstPassHelpLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(40)
        }
        
        secondPassHelpLabel.snp.makeConstraints { make in
            make.top.equalTo(firstPassTextField.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(14)
        }
        
        secondPassTextField.snp.makeConstraints { make in
            make.top.equalTo(secondPassHelpLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(40)
        }
        
        backJoonTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(secondPassTextField.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview()
            make.height.equalTo(30)
            
        }
        
        
        backJoonIdHelpLabel.snp.makeConstraints { make in
            make.top.equalTo(backJoonTitleLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(12)
            make.height.equalTo(14)
            make.trailing.equalToSuperview()
        }
        
        backJoonIdTextField.snp.makeConstraints { make in
            make.top.equalTo(backJoonIdHelpLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(40)
        }
        
        backJoonInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(backJoonIdTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(200)
        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(45)
        }
    }
    
}
