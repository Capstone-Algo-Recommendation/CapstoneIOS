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
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }

    @objc func moreButtonTapped() {
        print(items)
        
        items
        .bind(to: mainView.tableView.rx.items) { (tableView, row, element) in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProblemTableViewCell.identifier) as? ProblemTableViewCell else { return UITableViewCell()
                
            }
            cell.titleLabel.text = element.titleKo
            return cell
        }.disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "hl"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(moreButtonTapped))
        
        ApiService.getUserSolvedProblems { problems in
            self.items = Observable.just(problems.items)
        }
        
      
        
        
    }
    
}
