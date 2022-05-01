//
//  MainViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    

    var scrollView = UIScrollView()
    
    let threePickLabel = UILabel()
    let firstProblem = ProbleCellLikeView()
    let secondProblem = ProbleCellLikeView()
    let thirdProblem = ProbleCellLikeView()

    let colletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10

        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ProblemCollectionViewCell.self, forCellWithReuseIdentifier: ProblemCollectionViewCell.identifier)

        return cv
    }()
    
    
    let topRecommendView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255, alpha: 1)
        view.backgroundColor = .white
        title = "문제 풀어요~"
        
        colletionView.delegate = self
        colletionView.dataSource = self
        tabBarController?.tabBar.barTintColor = UIColor(red: 12/255, green: 18/255, blue: 29/255, alpha: 1)
        tabBarController?.tabBar.isTranslucent = false
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setUp()
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        threePickLabel.frame = CGRect(x: 20, y: 30, width: view.frame.width, height: 20)
        topRecommendView.frame = CGRect(x: 20, y: 55, width: view.frame.width, height: 200)
        colletionView.frame = CGRect(x: 20, y: 265, width: view.frame.width - 40, height: 1800)
        
        
        
        
        
        
        // 고정
        firstProblem.problemNumLabel.text = "1"
        secondProblem.problemNumLabel.text = "2"
        thirdProblem.problemNumLabel.text = "3"
        
        // 바꿔야 할것들
        firstProblem.problemTypeLabel.text = "dp"
        firstProblem.problemTitleLabel.text = "피보나치 수열"
        
        
        secondProblem.problemTitleLabel.text = "길찾기"
        secondProblem.problemTypeLabel.text = "bfs"
        
        
        thirdProblem.problemTitleLabel.text = "이렇게 저렇게 하는 거"
        thirdProblem.problemTypeLabel.text = "data structure"
        
    
        setUpConstraints()

    }
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        6
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProblemCollectionViewCell.identifier, for: indexPath) as? ProblemCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = UIColor(red: 35/255, green: 45/255, blue: 57/255, alpha: 1)
        cell.problemTitle.text = "hello world"
        cell.problemTitle.textColor = .white
        cell.problemNumber.textColor = .white
        
        return cell
    }
    
    
}

//UIColor(red: 20/255, green: 30/255, blue: 47/255, alpha: 1)  cell col

extension MainViewController {
    
    private func setUp() {
        
        scrollView.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255, alpha: 1)
        colletionView.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255, alpha: 1)
        
        
        view.addSubview(scrollView)
        topRecommendView.addSubview(firstProblem)
        topRecommendView.addSubview(secondProblem)
        topRecommendView.addSubview(thirdProblem)
        
        scrollView.addSubview(topRecommendView)
        scrollView.addSubview(colletionView)
        scrollView.addSubview(threePickLabel)
        threePickLabel.textColor = .white
        threePickLabel.text = "오늘의 추천 3문제"
        threePickLabel.font = .systemFont(ofSize: 25)
        
        
        firstProblem.addTarget(self, action: #selector(topTapped), for: .touchUpInside)
        firstProblem.isUserInteractionEnabled = true
        
        secondProblem.addTarget(self, action: #selector(topTapped), for: .touchUpInside)
        secondProblem.isUserInteractionEnabled = true
        
        thirdProblem.addTarget(self, action: #selector(topTapped), for: .touchUpInside)
        thirdProblem.isUserInteractionEnabled = true
    }
    
    private func setUpConstraints() {
        scrollView.contentSize = CGSize(width: view.frame.width - 20, height: 2200)
        
        firstProblem.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(self.view.snp.leading).offset(20)
            make.trailing.equalTo(self.view.snp.trailing).offset(-20)
            make.height.equalTo(40)
        }
        secondProblem.snp.makeConstraints { make in
            make.top.equalTo(firstProblem.snp.bottom).offset(15)
            make.leading.equalTo(self.view.snp.leading).offset(20)
            make.trailing.equalTo(self.view.snp.trailing).offset(-20)
            make.height.equalTo(40)
        }
        thirdProblem.snp.makeConstraints { make in
            make.top.equalTo(secondProblem.snp.bottom).offset(15)
            make.leading.equalTo(self.view.snp.leading).offset(20)
            make.trailing.equalTo(self.view.snp.trailing).offset(-20)
            make.height.equalTo(40)
        }
        
    }
}

// addTargets
extension MainViewController {
    
    @objc func topTapped() {
        print("Heelo")
    }
    
}


