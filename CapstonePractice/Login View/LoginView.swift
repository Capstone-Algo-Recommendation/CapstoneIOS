//
//  LoginView.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/21.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import Firebase
import SnapKit

final class LoginView: UIView {
    
    let backGroundImage = UIImageView()
    let discrpitionLabel = UILabel()
    let logoLabel = UILabel()
    
    let logoImageView = UIImageView()
    
    let startButton = UIButton()
    let registerButton = GIDSignInButton()
    
    
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
        
        addSubview(backGroundImage)
        
        backGroundImage.image = UIImage(named: "aa")
        addSubview(logoImageView)
        
        backGroundImage.addSubview(logoLabel)
        backGroundImage.addSubview(discrpitionLabel)
        
        
        addSubview(startButton)
        addSubview(registerButton)
        
        logoImageView.image = UIImage(named: "boj")
        
    
        
        logoLabel.textColor = .white
        discrpitionLabel.textColor = .white
        discrpitionLabel.numberOfLines = 0
        discrpitionLabel.text = "지금 풀어야 할 문제를 추천 받으세요! \n인공지능이 당신에게 맞는 최적의 문제를 추천해줍니다"
        discrpitionLabel.font = UIFont(name: FontNames.medium, size: 19)
        discrpitionLabel.textAlignment = .center
        
    
        logoLabel.textAlignment = .center
        logoLabel.font = UIFont(name: FontNames.bold, size: 25)
        logoLabel.text = "고플리의 백준 추천"

        startButton.setTitle("시작하기", for: .normal)
    
        
        startButton.backgroundColor = .systemOrange
        registerButton.backgroundColor = .lightGray
        startButton.setTitleColor(.white, for: .normal)
//        registerButton.setTitleColor(.white, for: .normal)
    }
    
    private func setUpConstraints() {
        
        backGroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        discrpitionLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(120)
            make.centerX.equalToSuperview()
            make.height.equalTo(90)
            make.width.equalTo(300)

        }
        
        logoImageView.snp.makeConstraints { make in
            make.bottom.equalTo(logoLabel.snp.top).offset(-60)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            make.height.equalTo(100)
        }
        
        logoLabel.snp.makeConstraints { make in
            make.bottom.equalTo(registerButton.snp.top).offset(-20)
            make.centerX.equalToSuperview()
            
            make.height.equalTo(40)
            make.width.equalTo(250)
        }
        
        registerButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-30)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
        }

    }
    
}
