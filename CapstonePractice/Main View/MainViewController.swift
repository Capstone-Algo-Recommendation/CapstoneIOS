//
//  MainViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    let mainView = MainView()
    let disposeBag = DisposeBag()
    let item = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.recommendCollectionView.delegate = self
        mainView.recommendCollectionView.dataSource = self
        title = "문제 풀어요~"
        
        
//        let items = Observable.just([1,2,3,4,5,5,6,6,7,8,9,0,7,67,6,4,4,4,3,2,6,6,7,8,9,0,7,67,6,4,4,4,3,2,6,6,7,8,9,0,7,67,6,4,4,4,3,2,6,6,7,8,9,0,7,67,6,4,4,4,3,2])
        
        let items2 = Observable.just([1,2,3,4,5,5,6,6,7,8,9,0,7,67,6,4,4,4,3,2,6,6,7,8,9,0,7,67,6,4,4,4,3,2,6,6,7,8,9,0,7,67,6,4,4,4,3,2,6,6,7,8,9,0,7,67,6,4,4,4,3,2])
        
//        items.bind(to:
//                    mainView.recommendCollectionView.rx.items(cellIdentifier: ProblemCollectionViewCell.identifier, cellType: ProblemCollectionViewCell.self)
//        )
//                { index, text, cell in
//
//
//                    if index % 3 == 0 {
//                        cell.backgroundColor = .gray
//                        cell.problemTitle.text = "this will be longer"
//                    }else if index % 3 == 1 {
//                        cell.backgroundColor = .green
//                        cell.problemTitle.text = "thjs hor"
//                    }else if index % 3 == 2 {
//                        cell.backgroundColor = .blue
//                        cell.problemTitle.text = "thjs"
//                    }
//
//
//                }
//                .disposed(by: disposeBag)
        
//        if let flowLayout = mainView.recommendCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//                    flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        }else {
//            print("not working ")
//        }
            
        items2.bind(to:
                    mainView.tryingCollectionView.rx.items(cellIdentifier: ProblemCollectionViewCell.identifier, cellType: ProblemCollectionViewCell.self)
        )
                { index, text, cell in
//                    cell.problemTitle.text = "he"
                    
                }
                .disposed(by: disposeBag)
        
        
        
    }
    
    
    
}




extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        item.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProblemCollectionViewCell.identifier, for: indexPath) as? ProblemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.item % 3 == 0 {
            cell.backgroundColor = .gray
            cell.problemTitle.text = "this will be longer"
        }else if indexPath.item % 3 == 1 {
            cell.backgroundColor = .green
            cell.problemTitle.text = "thjs hor"
        }else if indexPath.item % 3 == 2 {
            cell.backgroundColor = .blue
            cell.problemTitle.text = "thjs"
        }
        
        return cell
    
    }
}
