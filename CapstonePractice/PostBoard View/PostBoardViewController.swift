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
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(moreButtonTapped)),
            
            UIBarButtonItem(image: UIImage.init(systemName: "Human"), style: .plain, target: self, action: #selector(refresh))]
        
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        

    
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
        
        
        let a = element.writtenAt.substring(from: 5, to: 9)
        
        cell.dateIdLabel.text = a
        




        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PosterDetailViewController()
        vc.createdDate = viewModel.it[indexPath.row].writtenAt
        vc.boardNum = viewModel.it[indexPath.row].id
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
    
    @objc func refresh() {
        viewModel.loadPosts {
            DispatchQueue.main.async {
                self.mainView.tableView.reloadData()
            }
//            print(self.viewModel.it)
        }
    }
}


extension String {
    func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }

        // Index 값 획득
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1) // '+1'이 있는 이유: endIndex는 문자열의 마지막 그 다음을 가리키기 때문

        // 파싱
        return String(self[startIndex ..< endIndex])
    }
}

