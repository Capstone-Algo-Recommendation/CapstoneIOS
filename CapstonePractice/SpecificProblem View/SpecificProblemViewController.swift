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
    var problemInfo: Item?
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = problemTitle
        mainView.problemInfoLabel.text = problemInfo?.tags[0].key
        
        mainView.problemLinkButton
            .rx.tap
            .bind {
                let vc = BackJoonProblemViewController()
                vc.questionNumber = self.problemInfo?.problemID
                self.navigationController?.pushViewController(vc, animated: true)
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
        
        mainView.fixTextView
            .rx.didEndEditing
            .bind {
                if self.mainView.fixTextView.text.isEmpty {
                    self.mainView.fixTextView.text = "오답 노트를 입력해주세요."
                    self.mainView.fixTextView.textColor = UIColor.gray
                }
            }.disposed(by: disposeBag)
        
        
        
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

