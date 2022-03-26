//
//  WritePostViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import UIKit
import RxSwift
import RxCocoa

class WritePostViewController: UIViewController {
    
    let mainView = WritePosterView()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "글 쓰기"
        addTargets()

        mainView.textView
            .rx.didBeginEditing
            .bind {
                if self.mainView.textView.textColor == UIColor.lightGray {
                    self.mainView.textView.text = nil
                    self.mainView.textView.textColor = UIColor.black
                   }
            }.disposed(by: disposeBag)
        
        mainView.textView
            .rx.didEndEditing
            .bind {
                if self.mainView.textView.text.isEmpty {
                    self.mainView.textView.text = "내용을 입력해주세요."
                    self.mainView.textView.textColor = UIColor.lightGray
                }
            }.disposed(by: disposeBag)
    
        
//        mainView.textView
//            .rx.text.changed
//            .bind { text in
//            print("textview Text: \(text)")
//        }
    }
}

// AddTargets
extension WritePostViewController {
    private func addTargets() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "close_small"), style: .plain, target: self, action: #selector(closeButtonClcked))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "check"), style: .plain, target: self, action: #selector(postButtonClicked))
    }
    
    @objc func closeButtonClcked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func postButtonClicked() {
        print("need to post")
        mainView.textView.endEditing(true)
    }
}
