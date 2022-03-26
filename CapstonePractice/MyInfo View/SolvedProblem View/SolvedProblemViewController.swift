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
        items
        .bind(to: mainView.tableView.rx.items) { (tableView, row, element) in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProblemTableViewCell.identifier) as? ProblemTableViewCell else { return UITableViewCell()
            }
                    
            cell.titleLabel.text = element.titleKo
            cell.numberLabel.text = "문제 번호: \(element.problemID)"
            cell.keyLabel.text = element.tags[0].key
            return cell
        }.disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "성공한 문제"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(moreButtonTapped))
        
        ApiService.getUserSolvedProblems { problems in
            self.items = Observable.just(problems.items)
        }
        
        mainView.tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
}


extension SolvedProblemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
