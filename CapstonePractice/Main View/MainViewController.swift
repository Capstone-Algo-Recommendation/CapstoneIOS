//
//  MainViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let acviIndicator = UIActivityIndicatorView()
        acviIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        acviIndicator.center = self.view.center
        acviIndicator.color = .red
        acviIndicator.hidesWhenStopped = true
        
        acviIndicator.stopAnimating()
        return acviIndicator

    }()

    
    func createSpinnerView() {
        let child = SpinnerViewController()

        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)

        // wait two seconds to simulate some work happening
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // then remove the spinner view controller
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }
    
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
        cv.tag = 1
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
        cv.tag = 2
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
        cv.tag = 3
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
        cv.tag = 4
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
        cv.tag = 5
        cv.register(ProblemCollectionViewCell.self, forCellWithReuseIdentifier: ProblemCollectionViewCell.identifier)
//        cv.isScrollEnabled = false

        return cv
    }()
    
    let tmpView = UIView()
    let topRecommendView = UIView()
    var tm: [RecommendDatum] = []
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
    
            
//        print("?????")
//        self.tmpView.frame = self.view.frame
//        self.tmpView.backgroundColor = .white
//
//        self.view.addSubview(self.tmpView)
//        self.tmpView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//
//        }
    
        navigationController?.navigationBar.barTintColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        tabBarController?.tabBar.barTintColor = UIColor(red: 12/255, green: 18/255, blue: 29/255, alpha: 1)
        
        ApiService.getRecommendation { data in
            
        
            var counter = 0
            self.tm = []
            for problem in data.data {
                
                if counter < 3 {
                    self.tm.append(problem)
                    counter += 1
                } else {
                    if problem.categories[0] == "dp" {
                        self.recommendDP.append(problem)
                    } else if problem.categories[0] == "graphs" {
                        self.recommendGraph.append(problem)
                    } else if problem.categories[0] == "data_structures" {
                        self.recommendDS.append(problem)
                    } else if problem.categories[0] == "bruteforcing" {
                        self.recommendImplementation.append(problem)
                    } else {
                        self.recommendEtc.append(problem)
                    }
                }
            }
    
            DispatchQueue.main.async {
                
                for index in 0..<3 {
                    if index == 0 {
                        self.firstProblem.problemTitleLabel.text = self.tm[index].name
                        self.firstProblem.problemNumLabel.text = "\(self.tm[index].id)"
                        self.firstProblem.problemTypeLabel.text = self.tm[index].categories[0]
                    } else if index == 1 {
                        self.secondProblem.problemTitleLabel.text = self.tm[index].name
                        self.secondProblem.problemNumLabel.text = "\(self.tm[index].id)"
                        self.secondProblem.problemTypeLabel.text = self.tm[index].categories[0]
                        
                    } else {
                        self.thirdProblem.problemTitleLabel.text = self.tm[index].name
                        self.thirdProblem.problemNumLabel.text = "\(self.tm[index].id)"
                        self.thirdProblem.problemTypeLabel.text = self.tm[index].categories[0]
                        
                    }
                }
                
                self.dpColletionView.reloadData()
                self.dsColletionView.reloadData()
                self.graphColletionView.reloadData()
                self.greedyColletionView.reloadData()
                self.implementationColletionView.reloadData()
            }
        }
    }
    
    var recommendDP: [RecommendDatum] = []
    var recommendDS: [RecommendDatum] = []
    var recommendGraph: [RecommendDatum] = []
    var recommendImplementation: [RecommendDatum] = []
    var recommendEtc: [RecommendDatum] = []
    

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
        implemntationLabel.text = "Bruteforcing"
        greedyLabel.text = "ETC"
        
        
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
//        firstProblem.problemTypeLabel.text = "dp"
//        firstProblem.problemTitleLabel.text = "피보나치 수열"
//
//
//        secondProblem.problemTitleLabel.text = "길찾기"
//        secondProblem.problemTypeLabel.text = "bfs"
//
//
//        thirdProblem.problemTitleLabel.text = "이렇게 저렇게 하는 거"
//        thirdProblem.problemTypeLabel.text = "data structure"
        
    
        setUpConstraints()

    }
    
    let tempView1 = UIView()
    let tempLabel1 = UILabel()
    
    let tempView2 = UIView()
    let tempLabel2 = UILabel()
    
    let tempView3 = UIView()
    let tempLabel3 = UILabel()
    
    let tempView4 = UIView()
    let tempLabel4 = UILabel()
    
    let tempView5 = UIView()
    let tempLabel5 = UILabel()

    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {

            let vc = SpecificProblemViewController()
            vc.problemTitle = recommendDP[indexPath.item].name
            vc.problemType = recommendDP[indexPath.item].categories[0]
            vc.problemNumbeer = recommendDP[indexPath.item].id
            
            self.present(vc, animated: true, completion: nil)
            
        } else if collectionView.tag == 2 {
            
            let vc = SpecificProblemViewController()
            vc.problemTitle = recommendDS[indexPath.item].name
            vc.problemType = recommendDS[indexPath.item].categories[0]
            vc.problemNumbeer = recommendDS[indexPath.item].id
            
            self.present(vc, animated: true, completion: nil)
            
        } else if collectionView.tag == 3 {
            let vc = SpecificProblemViewController()
            vc.problemTitle = recommendGraph[indexPath.item].name
            vc.problemType = recommendGraph[indexPath.item].categories[0]
            vc.problemNumbeer = recommendGraph[indexPath.item].id
            
            self.present(vc, animated: true, completion: nil)
        } else if collectionView.tag == 4 {
            let vc = SpecificProblemViewController()
            vc.problemTitle = recommendImplementation[indexPath.item].name
            vc.problemType = recommendImplementation[indexPath.item].categories[0]
            vc.problemNumbeer = recommendImplementation[indexPath.item].id
            
            self.present(vc, animated: true, completion: nil)
        } else {
   
            let vc = SpecificProblemViewController()
            vc.problemTitle = recommendEtc[indexPath.item].name
            vc.problemType = recommendEtc[indexPath.item].categories[0]
            vc.problemNumbeer = recommendEtc[indexPath.item].id
            
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        tempView1.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        
        tempLabel1.textColor = .white
        tempLabel1.font = UIFont(name: FontNames.medium, size: 20)
        tempLabel1.textAlignment = .center
        tempView1.addSubview(tempLabel1)
        tempLabel1.text = "추천 문제가 없습니다"
        
        tempView2.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        
        tempLabel2.textColor = .white
        tempLabel2.font = UIFont(name: FontNames.medium, size: 20)
        tempLabel2.textAlignment = .center
        tempView2.addSubview(tempLabel2)
        tempLabel2.text = "추천 문제가 없습니다"
        
        
        tempView3.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        
        tempLabel3.textColor = .white
        tempLabel3.font = UIFont(name: FontNames.medium, size: 20)
        tempLabel3.textAlignment = .center
        tempView3.addSubview(tempLabel3)
        tempLabel3.text = "추천 문제가 없습니다"
        
        tempView4.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        
        tempLabel4.textColor = .white
        tempLabel4.font = UIFont(name: FontNames.medium, size: 20)
        tempLabel4.textAlignment = .center
        tempView4.addSubview(tempLabel4)
        tempLabel4.text = "추천 문제가 없습니다"
        
        
        tempView5.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 29/255,alpha: 1)
        
        tempLabel5.textColor = .white
        tempLabel5.font = UIFont(name: FontNames.medium, size: 20)
        tempLabel5.textAlignment = .center
        tempView5.addSubview(tempLabel5)
        tempLabel5.text = "추천 문제가 없습니다"
        
        
        
        if collectionView.tag == 1{

        
            let val = recommendDP.count
            if val == 0 {
                
                tempView1.isHidden = false
                collectionView.backgroundView = tempView1
                tempLabel1.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.width.equalTo(200)
                    make.height.equalTo(50)
                }
            }else {
                tempView1.isHidden = true
            }
            return val
        } else if collectionView.tag == 2 {
        
            tempLabel2.textColor = .white
            tempLabel2.font = UIFont(name: FontNames.medium, size: 20)
            tempLabel2.textAlignment = .center
            
            tempView2.addSubview(tempLabel2)
            let val = recommendDS.count
            if val == 0 {
              
                tempView2.isHidden = false
                collectionView.backgroundView = tempView2
                tempLabel2.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.width.equalTo(200)
                    make.height.equalTo(50)
                }
            }else {
                tempView2.isHidden = true
            }
            return val
        } else if collectionView.tag == 3 {
            

            tempLabel3.textColor = .white
            tempLabel3.font = UIFont(name: FontNames.medium, size: 20)
            tempLabel3.textAlignment = .center
            
            tempView3.addSubview(tempLabel3)
            let val = recommendGraph.count
            if val == 0 {
   
                tempView3.isHidden = false
                collectionView.backgroundView = tempView3
                tempLabel3.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.width.equalTo(200)
                    make.height.equalTo(50)
                }
            }else {
                tempView3.isHidden = true

            }
            return val
        } else if collectionView.tag == 4 {
            

            tempLabel4.textColor = .white
            tempLabel4.font = UIFont(name: FontNames.medium, size: 20)
            tempLabel4.textAlignment = .center
            
            tempView4.addSubview(tempLabel4)
            let val = recommendImplementation.count
            if val == 0 {
        
                tempLabel4.isHidden = false
                collectionView.backgroundView = tempView4
                tempLabel4.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.width.equalTo(200)
                    make.height.equalTo(50)
                }
            }else {
                tempLabel4.isHidden = true
    
            }
            return val
        } else {
            
    
            
            tempLabel5.textColor = .white
            tempLabel5.font = UIFont(name: FontNames.medium, size: 20)
            tempLabel5.textAlignment = .center
            
            tempView5.addSubview(tempLabel5)
            let val = recommendEtc.count
            if val == 0 {
            
                tempLabel5.isHidden = false
                collectionView.backgroundView = tempView5
                tempLabel5.snp.makeConstraints { make in
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview()
                    make.width.equalTo(200)
                    make.height.equalTo(50)
                }
            }else {
                tempLabel5.isHidden = true
        
            }
            return val
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProblemCollectionViewCell.identifier, for: indexPath) as? ProblemCollectionViewCell else { return UICollectionViewCell() }
        
        if collectionView.tag == 1 {
            cell.problemTitle.text = recommendDP[indexPath.row].name
            cell.problemNumber.text = "\(recommendDP[indexPath.row].id)"
            
            
        } else if collectionView.tag == 2{
            cell.problemTitle.text = recommendDS[indexPath.row].name
            cell.problemNumber.text = "\(recommendDS[indexPath.row].id)"
            
            
        } else if collectionView.tag == 3{
            
            cell.problemTitle.text = recommendGraph[indexPath.row].name
            cell.problemNumber.text = "\(recommendGraph[indexPath.row].id)"
            
        } else if collectionView.tag == 4{
            cell.problemTitle.text = recommendImplementation[indexPath.row].name
            cell.problemNumber.text = "\(recommendImplementation[indexPath.row].id)"
            
            
        } else {
            cell.problemTitle.text = recommendEtc[indexPath.row].name
            cell.problemNumber.text = "\(recommendEtc[indexPath.row].id)"
            
        }
        
        cell.backgroundColor = UIColor(red: 35/255, green: 45/255, blue: 57/255, alpha: 1)
//        cell.problemTitle.text = "hello world"
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
        
        
        firstProblem.addTarget(self, action: #selector(firstTapped), for: .touchUpInside)
        firstProblem.isUserInteractionEnabled = true
        
        secondProblem.addTarget(self, action: #selector(secondTapped), for: .touchUpInside)
        secondProblem.isUserInteractionEnabled = true
        
        thirdProblem.addTarget(self, action: #selector(thirdTapped), for: .touchUpInside)
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
    
    @objc func firstTapped() {
        let vc = SpecificProblemViewController()
        vc.problemTitle = tm[0].name
        vc.problemType = tm[0].categories[0]
        vc.problemNumbeer = tm[0].id
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func secondTapped() {
        let vc = SpecificProblemViewController()
        vc.problemTitle = tm[1].name
        vc.problemType = tm[1].categories[0]
        vc.problemNumbeer = tm[1].id
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func thirdTapped() {
        let vc = SpecificProblemViewController()
        vc.problemTitle = tm[2].name
        vc.problemType = tm[2].categories[0]
        vc.problemNumbeer = tm[2].id
        
        self.present(vc, animated: true, completion: nil)
    }

}


