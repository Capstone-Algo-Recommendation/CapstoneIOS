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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaults.standard.set("bck", forKey: bck)
        let a = UserDefaults.standard.string(forKey: "bck")
        print(a)
        title = "내 정보"
        
        let items = Observable.just(["백준 정보","성공한 문제", "실패한 문제"])
        
        
        items
        .bind(to: mainView.tableView.rx.items) { (tableView, row, element) in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyInfoTableViewCell.identifier) as? MyInfoTableViewCell else { return UITableViewCell()
            }
            cell.menuTitle.text = element
            
            if row == 1 {
                cell.menuImage.image = UIImage(named: "checked")
            }else if row == 2 {
                cell.menuImage.image = UIImage(named: "cancel")
            }
            return cell
        }.disposed(by: disposeBag)
        
        mainView.tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)

    }
    
}


extension MyInfoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1 {
            self.navigationController?.pushViewController(SolvedProblemViewController(), animated: true)
        }else if indexPath.row == 2 {
            self.navigationController?.pushViewController(WrongProblemViewController(), animated: true)
        }else {
            let vc = BackJoonInfoViewController()
            self.present(vc, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}
