//
//  WritePosterView.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import UIKit
import SnapKit

final class WritePosterView: UIView, SetUpView {

    let textView = UITextView()
    let someLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setUpConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        backgroundColor = .white
        addSubview(textView)
        addSubview(someLabel)
        
        textView.textColor = .lightGray
        textView.text = "내용을 입력해주세요."
        
        textView.font = .systemFont(ofSize: 15)
    }
    
    func setUpConstraints() {
        textView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
            
        }
    }
    
    
}
