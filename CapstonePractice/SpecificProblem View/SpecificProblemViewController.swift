//
//  SpecificProblemViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/28.
//

import UIKit
import RxCocoa
import RxSwift

class SpecificProblemViewController: UIViewController {
    
    var problemTitle: String?
    let mainView = SpecificProblemView()
    var problemNumbeer: Int?
    var problemType: String?
    var problemInfo: Item?
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("gg")
        UserDefaults.standard.set(mainView.memoTextView.text, forKey: problemTitle! + "\(problemNumbeer!)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = problemTitle
        mainView.problemInfoLabel.text = problemType
        mainView.problemTitle.text = problemTitle
        if let savedMemo = UserDefaults.standard.string(forKey: problemTitle! + "\(problemNumbeer!)") {
            mainView.memoTextView.text = savedMemo
        }
        
        mainView.closeButton
            .rx.tap
            .bind { _ in
                self.dismiss(animated: true, completion: nil)
            }.disposed(by: disposeBag)
        
        mainView.problemLinkButton
            .rx.tap
            .bind {
                print("aaa")
                let vc = BackJoonProblemViewController()
                vc.questionNumber = self.problemNumbeer
                self.present(vc, animated: true, completion: nil)

            }.disposed(by: disposeBag)
        
        
        mainView.keyBoardHideButton.rx.tap.bind { _ in
            self.mainView.endEditing(true)
            self.view.endEditing(true)
            self.mainView.memoTextView.resignFirstResponder()
        }.disposed(by: disposeBag)
        mainView.memoTextView
            .rx.didBeginEditing
            .bind {
                if self.mainView.memoTextView.textColor == UIColor.gray {
                    self.mainView.memoTextView.text = nil
                    self.mainView.memoTextView.textColor = UIColor.black
                   }
            }.disposed(by: disposeBag)
        
        mainView.fixTextView
            .rx.didBeginEditing
            .bind {
                if self.mainView.fixTextView.textColor == UIColor.gray {
                    self.mainView.fixTextView.text = nil
                    self.mainView.fixTextView.textColor = UIColor.black
                   }
            }.disposed(by: disposeBag)
        
        mainView.memoTextView
            .rx.didEndEditing
            .bind {
                if self.mainView.memoTextView.text.isEmpty {
                    self.mainView.memoTextView.text = "메모를 입력해주세요."
                    self.mainView.memoTextView.textColor = UIColor.gray
                }
            }.disposed(by: disposeBag)
        
//        mainView.fixTextView
//            .rx.didEndEditing
//            .bind {
//                if self.mainView.fixTextView.text.isEmpty {
//                    self.mainView.fixTextView.text = "오답 노트를 입력해주세요."
//                    self.mainView.fixTextView.textColor = UIColor.gray
//                }
//            }.disposed(by: disposeBag)
//
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(problemStatusButtonClicked))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: ProblemSolvedStatus.notTried.rawValue, style: .plain, target: self, action: #selector(problemStatusButtonClicked))
        
        
        
    }
    
    @objc func problemStatusButtonClicked() {
        
        
        let alertVC = UIAlertController(title: "영수증으로 내역을 첨부하시겠습니까?", message: "", preferredStyle: .actionSheet)
        
        let solvedButton = UIAlertAction(title: "성공", style: .default, handler: { _ in
            self.navigationItem.rightBarButtonItem?.title = "성공"
        })
        let failedButton = UIAlertAction(title: "실패", style: .default, handler: { _ in
            self.navigationItem.rightBarButtonItem?.title = "실패"
        })
        let notTriedButton = UIAlertAction(title: "시도중", style: .default, handler: { _ in
            self.navigationItem.rightBarButtonItem?.title = "시도중"
        })
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertVC.addAction(solvedButton)
        alertVC.addAction(failedButton)
        alertVC.addAction(notTriedButton)
        alertVC.addAction(cancelButton)
        
        present(alertVC, animated: true, completion: nil)
   
    }
    
}

enum ProblemSolvedStatus: String {
    
    case solved = "성공"
    case failed = "실패"
    case notTried = "시도해보세요"
}

