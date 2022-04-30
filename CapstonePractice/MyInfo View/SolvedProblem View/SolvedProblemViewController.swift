//
//  SolvedProblemViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import UIKit
import RxSwift
import RxCocoa

class SolvedProblemViewController: UIViewController {
    
    let mainView = SolvedProblemView()
//    var items = Observable.just([Item(problemID: 3, titleKo: "2", isSolvable: true, isPartial: true, acceptedUserCount: 2, level: 2, votedUserCount: 2, isLevelLocked: true, averageTries: 2.2, official: true, tags: [])])
    
    var itemss = Observable<[Item]>.empty()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    private func loadData() {
        
        ApiService.getUserTriedByProblems { problems in
            self.itemss = Observable.just(problems.items)
            self.itemss
                    .bind(to: self.mainView.tableView.rx.items) { (tableView, row, element) in
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: ProblemTableViewCell.identifier) as? ProblemTableViewCell else { return UITableViewCell()
                    }
                            
                    cell.titleLabel.text = element.titleKo
                    cell.numberLabel.text = "문제 번호: \(element.problemID)"
                    cell.keyLabel.text = element.tags[0].key
                    return cell
                }.disposed(by: self.disposeBag)
        }
        
    }

    
    @objc func filterProblems() {
        let alertVC = UIAlertController(title: "보고 싶은 알고리즘을 선택해주세요", message: "", preferredStyle: .alert)
        
        let dpButton = UIAlertAction(title: "다이나믹 프로그래밍", style: .default, handler: nil)
        let dataStructureButton = UIAlertAction(title: "자료구조", style: .default, handler: nil)
        let graphButton = UIAlertAction(title: "그래프", style: .default, handler: nil)
        let implementationButton = UIAlertAction(title: "구현", style: .default, handler: nil)
        let greedyButton = UIAlertAction(title: "그리디", style: .default, handler: nil)
        let etcButton = UIAlertAction(title: "기타", style: .default, handler: nil)
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertVC.addAction(dpButton)
        alertVC.addAction(dataStructureButton)
        alertVC.addAction(graphButton)
        alertVC.addAction(implementationButton)
        alertVC.addAction(greedyButton)
        alertVC.addAction(etcButton)
        alertVC.addAction(cancelButton)
        
        present(alertVC, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        title = "성공한 문제"
        
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "필터", style: .plain, target: self, action: #selector(filterProblems)),UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(moreButtonTapped))]
        
        
        
        
        mainView.tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        mainView.tableView.rx.modelSelected(Item.self)
            .subscribe { item in
                
                
                let vc = SpecificProblemViewController()
                vc.problemTitle = "\(item.element!.problemID). \(item.element!.titleKo)"
                vc.problemInfo = item.element
                self.navigationController?.pushViewController(vc, animated: true)
                
            }.disposed(by: disposeBag)
    }
}


extension SolvedProblemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
