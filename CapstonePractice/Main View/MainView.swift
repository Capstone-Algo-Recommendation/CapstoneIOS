//
//  File.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/30.
//

import UIKit
import SnapKit

class MainView: UIView, SetUpView {
    
    let recommendProblem = UILabel()
    
    let recommendCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        
        cv.register(ProblemCollectionViewCell.self, forCellWithReuseIdentifier: ProblemCollectionViewCell.identifier)
        cv.backgroundColor = .white
        return cv
    }()
    
    let tryingProblem = UILabel()
    let tryingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10

        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ProblemCollectionViewCell.self, forCellWithReuseIdentifier: ProblemCollectionViewCell.identifier)
        cv.backgroundColor = .white

        return cv
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        keyBoardHiddenConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    func setUp() {
        backgroundColor = .white
        
        addSubview(recommendProblem)
        addSubview(recommendCollectionView)
        
        addSubview(tryingProblem)
        addSubview(tryingCollectionView)
        
        recommendProblem.textColor = UIColor(red: 67/255, green: 89/255, blue: 106/255, alpha: 1)
        tryingProblem.textColor = UIColor(red: 182/255, green: 78/255, blue: 61/255, alpha: 1)
        
        recommendProblem.text = "추천 문제"
        tryingProblem.text = "시도중인 문제"
        
        recommendProblem.font = .systemFont(ofSize: 23)
        tryingProblem.font = .systemFont(ofSize: 23)
    }
    
    func keyBoardHiddenConstraints() {
        
        recommendProblem.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(8)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        
        
        recommendCollectionView.snp.makeConstraints { make in
            make.top.equalTo(recommendProblem.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            
            make.height.equalTo(self.snp.height).multipliedBy(0.3)
        }
        
        tryingProblem.snp.makeConstraints { make in
            make.top.equalTo(recommendCollectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        
        tryingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(tryingProblem.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            
            make.height.equalTo(self.snp.height).multipliedBy(0.3)
        }
    }

}
