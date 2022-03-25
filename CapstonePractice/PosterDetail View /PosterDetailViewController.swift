//
//  PosterDetailViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import RxSwift
import RxCocoa

class PosterDetailViewController: UIViewController {
    
    let mainView = PosterDetailView()
    let viewModel = PosterDetailViewModel()
    
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewModel.items
        .bind(to: mainView.tableView.rx.items) { (tableView, row, element) in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterDetailMainCell.identifier) as? PosterDetailMainCell else { return UITableViewCell()
            }
            
            cell.posterContentLabel.text = element.content
            cell.posterTitleLabel.text = element.title
            cell.createdDateLabel.text = element.writtenDate
             
            return cell
        }
        .disposed(by: disposeBag)
        
    }
}

extension PosterDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        }else {
            return 90
        }
    }
}
