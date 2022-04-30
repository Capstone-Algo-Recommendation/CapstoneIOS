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
    var items = Observable.just([Item(problemID: 3, titleKo: "2", isSolvable: true, isPartial: true, acceptedUserCount: 2, level: 2, votedUserCount: 2, isLevelLocked: true, averageTries: 2.2, official: true, tags: [])])
    
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

    @objc func moreButtonTapped() {
        print("hello")
    }
    
    @objc func filterProblems() {
        print("sleec filter")
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
