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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
        viewModel.loadPosts {
            DispatchQueue.main.async {
                self.mainView.tableView.reloadData()
            }
//            print(self.viewModel.it)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "게시판"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(moreButtonTapped))
        
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
        
        
//        viewModel.items
//        .bind(to: mainView.tableView.rx.items) { (tableView, row, element) in
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.identifier) as? PosterTableViewCell else { return UITableViewCell()
//
//            }
//
//            cell.titleLabel.text = element.title
//            cell.contentLabel.text = element.content
//            cell.dateIdLabel.text = element.writtenDate
//
//            return cell
//        }
//        .disposed(by: disposeBag)
//
////        viewModel.loadPosts()
////        mainView.tableView.reloadData()
//
//        mainView.tableView
//            .rx.setDelegate(self)
//            .disposed(by: disposeBag)
//    }
    
    }
}


//
extension PostBoardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.it.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.identifier, for: indexPath) as? PosterTableViewCell else  {
            return UITableViewCell()
        }


        let element = viewModel.it[indexPath.row]

        cell.titleLabel.text = element.title
        cell.contentLabel.text = element.content
//        cell.dateIdLabel.text = element.writtenDate


        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PosterDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

// Add Targets
extension PostBoardViewController {
    @objc func moreButtonTapped() {
    
        let alertVC = UIAlertController(title: "", message: "게시판 메뉴", preferredStyle: .actionSheet)

        let fromGallaryButton = UIAlertAction(title: "글 쓰기", style: .default) { _ in
            let vc = UINavigationController(rootViewController: WritePostViewController())
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
        }

        let cancelButton = UIAlertAction(title: "취소", style: .cancel)

        alertVC.addAction(fromGallaryButton)
        alertVC.addAction(cancelButton)

        present(alertVC, animated: true, completion: nil)
        
    }
}



