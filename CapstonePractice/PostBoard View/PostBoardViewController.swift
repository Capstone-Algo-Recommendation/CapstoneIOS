//
//  PostBoardViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import RxSwift
import RxCocoa

class PostBoardViewController: UIViewController {
    
    let mainView = PosterView()
    let viewModel = PosterViewModel()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello world")
        
        viewModel.items
        .bind(to: mainView.tableView.rx.items) { (tableView, row, element) in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.identifier) as? PosterTableViewCell else { return UITableViewCell()
                
            }
            
            cell.titleLabel.text = element.title
            cell.contentLabel.text = element.content
            cell.dateIdLabel.text = element.writtenDate
             
            return cell
        }
        .disposed(by: disposeBag)
        
        mainView.tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        
    }
    
}

extension PostBoardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hell")
        let vc = PosterDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
