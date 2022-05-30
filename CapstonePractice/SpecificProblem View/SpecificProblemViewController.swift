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
        
        
        
        ApiService.getSpecificProblemInfo(problemNum: self.problemNumbeer!) { data in
            if data.data.status  == nil {
                DispatchQueue.main.async {
                    self.mainView.problemQuestionButton.setTitle("문제 상태 설정", for: .normal)
                }
                
            } else {
                DispatchQueue.main.async {
                    
                    self.mainView.problemQuestionButton.setTitle(data.data.status!, for: .normal)
                }
            }
        }
        
//        COMPLETE
//        TRYING
//        FAILED
        
        mainView.closeButton
            .rx.tap
            .bind { _ in
                self.dismiss(animated: true, completion: nil)
            }.disposed(by: disposeBag)
        
        mainView.problemLinkButton
            .rx.tap
            .bind {
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

        
        mainView.problemQuestionButton
            .rx.tap
            .bind {
                let alertVC = UIAlertController(title: "문제에 성공하셨나요?", message: "", preferredStyle: .actionSheet)
                
                let successButton = UIAlertAction(title: "성공", style: .default, handler: { _ in
                    ApiService.addSolvedProble(problemNum: self.problemNumbeer!)
                    self.mainView.problemQuestionButton.setTitle("성공", for: .normal)
                })
                let tryingButton = UIAlertAction(title: "시도중", style: .default, handler: { _ in
                    ApiService.changeProblemStatus(problemNum: self.problemNumbeer!, status: "TRYING") { _ in
                        print("changed")
                    }
                    self.mainView.problemQuestionButton.setTitle("시도중", for: .normal)
                })
                let failedButton = UIAlertAction(title: "실패", style: .default, handler: { _ in
                    self.mainView.problemQuestionButton.setTitle("실패", for: .normal)
                    ApiService.changeProblemStatus(problemNum: self.problemNumbeer!, status: "FAILED") { _ in
                        print("changed")
                    }
                })
                
                
                let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
                
                alertVC.addAction(successButton)
//                alertVC.addAction(tryingButton)
                alertVC.addAction(failedButton)
                alertVC.addAction(cancelButton)
                
                self.present(alertVC, animated: true, completion: nil)
                

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

