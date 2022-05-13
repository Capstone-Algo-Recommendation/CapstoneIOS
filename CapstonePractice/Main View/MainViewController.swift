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

    let dpLabel = UILabel()
    let dpColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10

        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ProblemCollectionViewCell.self, forCellWithReuseIdentifier: ProblemCollectionViewCell.identifier)
//        cv.isScrollEnabled = false

        return cv
    }()
    
    let dsLabel = UILabel()
    let dsColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10

        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ProblemCollectionViewCell.self, forCellWithReuseIdentifier: ProblemCollectionViewCell.identifier)
//        cv.isScrollEnabled = false

        return cv
    }()
    
    let graphLabel = UILabel()
    let graphColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10

        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ProblemCollectionViewCell.self, forCellWithReuseIdentifier: ProblemCollectionViewCell.identifier)
//        cv.isScrollEnabled = false

        return cv
    }()
    
    let implemntationLabel = UILabel()
    let implementationColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10

        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ProblemCollectionViewCell.self, forCellWithReuseIdentifier: ProblemCollectionViewCell.identifier)
//        cv.isScrollEnabled = false

        return cv
    }()
    
    let greedyLabel = UILabel()
    let greedyColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10

        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ProblemCollectionViewCell.self, forCellWithReuseIdentifier: ProblemCollectionViewCell.identifier)
//        cv.isScrollEnabled = false

        return cv
    }()
    
    
    let topRecommendView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.green]
        
        title = "문제 풀어요~"
        
        dpColletionView.delegate = self
        dpColletionView.dataSource = self
        
        dsColletionView.delegate = self
        dsColletionView.dataSource = self
        
        graphColletionView.delegate = self
        graphColletionView.dataSource = self
        
        implementationColletionView.delegate = self
        implementationColletionView.dataSource = self
        
        
        greedyColletionView.delegate = self
        greedyColletionView.dataSource = self
        
    
        navigationController?.navigationBar.barTintColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        

        tabBarController?.tabBar.barTintColor = UIColor(red: 12/255, green: 18/255, blue: 29/255, alpha: 1)
        
        //        navigationController?.navigationBar.isTranslucent = false
        //        tabBarController?.tabBar.isTranslucent = false

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
        
//        scrollView.bringSubviewToFront(dpLabel)
//        dpLabel.text = " hhhhhhh"
        dpLabel.frame = CGRect(x: 20, y: 270, width: 200, height: 30)
    
        dpColletionView.frame = CGRect(x: 20, y: 310, width: view.frame.width - 40, height: 220)
        
        
        
        
        dsLabel.frame = CGRect(x: 20, y: 575, width: 200, height: 30)
        dsColletionView.frame = CGRect(x: 20, y: 615, width: view.frame.width - 40, height: 220)
        
        graphLabel.frame = CGRect(x: 20, y: 895, width: 200, height: 30)
        graphColletionView.frame = CGRect(x: 20, y: 935, width: view.frame.width - 40, height: 220)
        
        implemntationLabel.frame = CGRect(x: 20, y: 1200, width: 200, height: 30)
        implementationColletionView.frame = CGRect(x: 20, y: 1240, width: view.frame.width - 40, height: 220)
        
        
        greedyLabel.frame = CGRect(x: 20, y: 1495, width: 200, height: 30)
        greedyColletionView.frame = CGRect(x: 20, y: 1535, width: view.frame.width - 40, height: 220)
        
    
        
        
        // 고정
        firstProblem.problemNumLabel.text = "1"
        secondProblem.problemNumLabel.text = "2"
        thirdProblem.problemNumLabel.text = "3"
        
        dpLabel.text = "DP"
        dsLabel.text = "Data Structure"
        graphLabel.text = "Graph"
        implemntationLabel.text = "Implementation"
        greedyLabel.text = "Greedy"
        
        
        dpLabel.textColor = .white
        dsLabel.textColor = .white
        graphLabel.textColor = .white
        implemntationLabel.textColor = .white
        greedyLabel.textColor = .white
        
            
        dpLabel.font = .boldSystemFont(ofSize: 23)

        dsLabel.font = .boldSystemFont(ofSize: 23)
        graphLabel.font = .boldSystemFont(ofSize: 23)
        implemntationLabel.font = .boldSystemFont(ofSize: 23)
        greedyLabel.font = .boldSystemFont(ofSize: 23)
        
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

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
//    collec
    
    
}

//UIColor(red: 20/255, green: 30/255, blue: 47/255, alpha: 1)  cell col

extension MainViewController {
    
    private func setUp() {
        
        scrollView.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255, alpha: 1)
        
        
        dpColletionView.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255, alpha: 1)
        dsColletionView.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255, alpha: 1)
        graphColletionView.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255, alpha: 1)
        implementationColletionView.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255, alpha: 1)
        greedyColletionView.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255, alpha: 1)
        
        
        view.addSubview(scrollView)
        topRecommendView.addSubview(firstProblem)
        topRecommendView.addSubview(secondProblem)
        topRecommendView.addSubview(thirdProblem)
        
        scrollView.addSubview(topRecommendView)
        scrollView.addSubview(dpColletionView)
        scrollView.addSubview(dsColletionView)
        scrollView.addSubview(graphColletionView)
        scrollView.addSubview(implementationColletionView)
        scrollView.addSubview(greedyColletionView)
        

        scrollView.addSubview(dpLabel)
        scrollView.addSubview(dsLabel)
        scrollView.addSubview(graphLabel)
        scrollView.addSubview(implemntationLabel)
        scrollView.addSubview(greedyLabel)
        
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
        scrollView.contentSize = CGSize(width: view.frame.width - 20, height: 1780)
        
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


