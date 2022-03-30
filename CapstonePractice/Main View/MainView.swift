//
//  File.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/30.
//

import UIKit
import SnapKit

class CollectionViewLeftAlignFlowLayout: UICollectionViewFlowLayout {
    
   let cellSpacing: CGFloat = 8

   override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
       self.minimumLineSpacing = 8
       self.sectionInset = UIEdgeInsets(top: 0, left: 16.0, bottom: 0.0, right: 30)
       
       let attributes = super.layoutAttributesForElements(in: rect)

       var leftMargin = sectionInset.left
       var maxY: CGFloat = -1.0
       attributes?.forEach { layoutAttribute in
           if layoutAttribute.frame.origin.y >= maxY {
               leftMargin = sectionInset.left
       }
           layoutAttribute.frame.origin.x = leftMargin
           leftMargin += layoutAttribute.frame.width + cellSpacing
           maxY = max(layoutAttribute.frame.maxY, maxY)
       }
       return attributes
   }
}

class MainView: UIView, SetUpView {
    
    let recommendProblem = UILabel()
    
    let recommendCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.estimatedItemSize = .zero
        
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        
        cv.register(ProblemCollectionViewCell.self, forCellWithReuseIdentifier: ProblemCollectionViewCell.identifier)
        
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

        return cv
    }()
    

    
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
        
        addSubview(recommendProblem)
        addSubview(recommendCollectionView)
        
        addSubview(tryingProblem)
        addSubview(tryingCollectionView)
        
        recommendProblem.text = "추천 문제"
        tryingProblem.text = "시도중인 문제"
        
        recommendProblem.font = .systemFont(ofSize: 23)
        tryingProblem.font = .systemFont(ofSize: 23)
    }
    
    func setUpConstraints() {
        
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
