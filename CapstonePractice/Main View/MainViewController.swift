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
    
    let items = Observable.just([1,2,3,4,5,5,6,6,7,8,9,0,7,67,6,4,4,4,3,2,6,6,7,8,9,0,7,67,6,4,4,4,3,2,6,6,7,8,9,0,7,67,6,4,4,4,3,2,6,6,7,8,9,0,7,67,6,4,4,4,3,2])
    
    let items2 = Observable.just([1,2,3,4,5,5,6,6,7,8,9,0,7,67,6,4,4,4,3,2,6,6,7,8,9,0,7,67,6,4,4,4,3,2,6,6,7,8,9,0,7,67,6,4,4,4,3,2,6,6,7,8,9,0,7,67,6,4,4,4,3,2])
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "문제 풀어요~"
        mainView.recommendCollectionView.delegate = self
        mainView.tryingCollectionView.delegate = self

        items.bind(to:
                    mainView.recommendCollectionView.rx.items(cellIdentifier: ProblemCollectionViewCell.identifier, cellType: ProblemCollectionViewCell.self)
        )
                { index, text, cell in


                    if index % 3 == 0 {
                        cell.backgroundColor = UIColor(red: 185/255, green: 189/255, blue: 182/255, alpha: 1)
                        cell.problemTitle.text = "this will be longer"
                    }else if index % 3 == 1 {
                        cell.backgroundColor = UIColor(red: 145/255, green: 190/255, blue: 197/255, alpha: 1)
                        cell.problemTitle.text = "thjs hor"
                    }else if index % 3 == 2 {
                        cell.backgroundColor = UIColor(red: 126/255, green: 168/255, blue: 145/255, alpha: 1)
                        cell.problemTitle.text = "thjs"
                    }


                }
                .disposed(by: disposeBag)
            
        items2.bind(to:
                    mainView.tryingCollectionView.rx.items(cellIdentifier: ProblemCollectionViewCell.identifier, cellType: ProblemCollectionViewCell.self)
        )
                { index, text, cell in
                    if index % 3 == 0 {
                        cell.backgroundColor = UIColor(red: 185/255, green: 189/255, blue: 182/255, alpha: 1)
                        cell.problemTitle.text = "this will be longer"
                    }else if index % 3 == 1 {
                        cell.backgroundColor = UIColor(red: 145/255, green: 190/255, blue: 197/255, alpha: 1)
                        cell.problemTitle.text = "thjs hor"
                    }else if index % 3 == 2 {
                        cell.backgroundColor = UIColor(red: 126/255, green: 168/255, blue: 145/255, alpha: 1)
                        cell.problemTitle.text = "thjs"
                    }
                }
                .disposed(by: disposeBag)
        
        
        
        mainView.recommendCollectionView
            .rx.modelSelected(Int.self)
            .bind { item in
                print("hello",item)
            }
        
        mainView.tryingCollectionView
            .rx.modelSelected(Int.self)
            .bind { _ in
                print("H")
            }.disposed(by: disposeBag)
        
    }
    
}






extension MainViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: collectionView.frame.height / 3 - 15)
    }
    
}



//extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//

//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        item.count
//    }

//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProblemCollectionViewCell.identifier, for: indexPath) as? ProblemCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//
//        if indexPath.item % 3 == 0 {
//            cell.problemTitle.text = "this will be longer"
//        }else if indexPath.item % 3 == 1 {
//            cell.problemTitle.text = "thjs hor"
//            cell.backgroundColor = .gray
//        }else if indexPath.item % 3 == 2 {
//            cell.problemTitle.text = "thjs"
//        }
//        return cell
//    }
//}
