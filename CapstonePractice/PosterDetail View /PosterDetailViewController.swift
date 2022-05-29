//
//  PosterDetailViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources


class PosterDetailViewController: UIViewController {
    
    let mainView = PosterDetailView()
    let viewModel = PosterDetailViewModel()
    var createdDate: String?
    var boardNum: Int?
    var sections: [SectionOfCustomData] = []
    
    let disposeBag = DisposeBag()
    var info: SpsecificPostData?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("refreshing")
    
        ApiService.getSpecificPost(postid: boardNum!) { a in
            print("good", a )
            self.info = a
            
            self.commentCount = 1
            DispatchQueue.main.async {
                self.mainView.tableView.reloadData()
            }
        
        }
    }
    
    
    var commentCount = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        addTargets()
    }
    
    private func addTargets() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        mainView.sendButton.rx.tap.bind { _ in
            
            // TODO: Send button  보내기
            if let commentText = self.mainView.commentTextView.text, commentText.count > 0 {
                self.commentCount = 1
                ApiService.writeComment(postId: self.boardNum!, content: commentText) {
                    ApiService.getSpecificPost(postid: self.boardNum!) { a in
                        
                        self.info = a
                        
                        DispatchQueue.main.async {
                            self.mainView.tableView.reloadData()
                            self.mainView.commentTextView.text = ""
                        }
                    }
                }
            }
        }.disposed(by: disposeBag)

    }
    
    @objc func keyBoardWillShow(_ sender: Notification) {
        var keyboardHeight: CGFloat = 0
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRect = keyboardFrame.cgRectValue
            
            keyboardHeight = keyboardRect.height
        }

        mainView.keyBoardShowConstraints(keyBoardHeight: keyboardHeight)
    }
    
    @objc func keyboardWillHide() {
        mainView.keyBoardHiddenConstraints()
    }
}

extension PosterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return info?.data.comments?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterDetailMainCell.identifier, for: indexPath) as? PosterDetailMainCell else {
                return UITableViewCell()
                
            }

            if let name = UserDefaults.standard.string(forKey: "UserName") {
                cell.authorLabel.text = "익명 " + name
            }
            
            cell.posterTitleLabel.text = info?.data.title
            cell.posterContentLabel.text = info?.data.content
            
            
            let a = createdDate!.substring(from: 5, to: 9)
            cell.createdDateLabel.text = a
            
            return cell
            
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterDetailCommentCell.identeifier, for: indexPath) as? PosterDetailCommentCell else {
                return UITableViewCell()
                
            }
            
//            cell.backgroundColor = .lightGray
            
            cell.contentLablel.text = info?.data.comments?[indexPath.row].content
            cell.userIdLabel.text = "익명 \(self.commentCount)"
            self.commentCount += 1

            return cell
        }
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        mainView.commentTextView.resignFirstResponder()
        mainView.resignFirstResponder()
        mainView.endEditing(true)
        mainView.commentTextView.endEditing(true)
        scrollView.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ASDf")
    }
    
    
}
