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

        if let text = mainView.textView.text {
            
            
            
            var content = ""
            var title = ""
            var ind = 0
            
            let lines = text.components(separatedBy: "\n")
            
            for line in lines {
                if ind == 0 {
                    title = line
                    ind += 1
                } else {
                    content = content + line
                }
                
            }
       
            ApiService.writePost(title: title, content: content)
            
            print("worked")
            self.dismiss(animated: true, completion: nil)
        }else {
            print("someThing wrong")
        }
        
        
        
    }
    
    func thankYou(to Jack: String, to2 Hue: String, to3 Dustin: String) {
        print("\(Jack)님, \(Hue)님, \(Dustin)님 새싹 1기 수고 많으셨습니다!! ")
        print("새싹 2기도 화이팅!!  ")
        print("By 새싹 1기 수강생 Yundong Lee")
        
    }
}
