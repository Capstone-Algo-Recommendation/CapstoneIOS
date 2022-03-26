//
//  MyInfoViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import RxSwift
import RxCocoa

class MyInfoViewController: UIViewController {
    
    let mainView = MyInfoView()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let items = Observable.just(["푼 문제", "실패한 문제"])
        
        
        items
        .bind(to: mainView.tableView.rx.items) { (tableView, row, element) in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.identifier) as? PosterTableViewCell else { return UITableViewCell()
                
            }
            cell.titleLabel.text = element
            return cell
        }.disposed(by: disposeBag)
        
        mainView.tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
        
//        ApiService.getUserSolvedProblems()
    }
    
}


extension MyInfoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UINavigationController(rootViewController: SolvedProblemViewController())

        present(vc, animated: true, completion: nil)
        
    }
}
