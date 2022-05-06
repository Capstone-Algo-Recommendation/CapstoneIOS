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
    
    let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = mainView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        addTargets()

        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfCustomData>(
          configureCell: { dataSource, tableView, indexPath, item in
              
              if indexPath.section == 0 {
                  guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterDetailMainCell.identifier, for: indexPath) as? PosterDetailMainCell else { return UITableViewCell() }
                  
                
                  
                return cell
              }else {
                  guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterDetailCommentCell.identeifier, for: indexPath) as? PosterDetailCommentCell else { return UITableViewCell() }
                  
                  
                  cell.contentLablel.text = item.content
                  
                  return cell
              }
          })
        
        let sections = [
          SectionOfCustomData(header: "First section", items: [Poster(title: "as", content: "AS", writtenDate: "AS", like: "AS")]),
          SectionOfCustomData(
            header: "Second section",
            items: [
                Poster(title: "As", content: "와우 굉장히 유익한 글입니다.", writtenDate: "G", like: "v"),
                Poster(title: "As", content: "따봉 박고 시작 하자 얘드라", writtenDate: "G", like: "v"),
                Poster(title: "As", content: "ㅋㅋ 개꿀 좋다리 , ㅇㅈ? ㅋㅋㅋㅋㅋ ", writtenDate: "G", like: "v"),
                Poster(title: "As", content: "이건 좋습니다 반복. 이건 좋습니다 반복. 이건 좋습니다 반복. 이건 좋습니다 반복. 이건 좋습니다 반복. 이건 좋습니다 반복. 이건 좋습니다 반복. 이건 좋습니다 반복. 이건 좋습니다 반복. 이건 좋습니다 반복. 이건 좋습니다 반복. 이건 좋습니다 반복. ", writtenDate: "G", like: "v"),
                Poster(title: "As", content: "굉장히 좋다리", writtenDate: "G", like: "v"),
                Poster(title: "As", content: "나 누구게", writtenDate: "G", like: "v"),
                Poster(title: "As", content: "커피", writtenDate: "G", like: "v"),
                Poster(title: "As", content: "좋은 글 ㅇㅈ ", writtenDate: "G", like: "v"),
                Poster(title: "As", content: "나 집가고 싶니? 나 집가고 싶니? 나 집가고 싶니? 나 집가고 싶니? 나 집가고 싶니? 나 집가고 싶니? 나 집가고 싶니? 나 집가고 싶니? 나 집가고 싶니? 나 집가고 싶니? 나 집가고 싶니? ", writtenDate: "G", like: "v"),
                
            ]
          )
        ]
        
        mainView.tableView
            .rx.itemSelected.bind { _ in
                print("hh")
                self.view.endEditing(true)
            }.disposed(by: disposeBag)

        Observable.just(sections)
            .bind(to: mainView.tableView.rx.items(dataSource: dataSource))
          .disposed(by: disposeBag)
     
    }
    
    private func addTargets() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        mainView.sendButton.rx.tap.bind { _ in
            
            // TODO: Send button  보내기
            print("hl")
            
        }.disposed(by: disposeBag)
        
        
        
        
        
    }
    
    @objc func keyBoardWillShow(_ sender: Notification) {
        var keyboardHeight: CGFloat = 0
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRect = keyboardFrame.cgRectValue
            
            keyboardHeight = keyboardRect.height
        }
        
//        if viewModel.open {
//            mainView.setUpKeyBoardConstraints(keyboardHeight: keyboardHeight)
//        }else {
//            mainView.setUpNormalConstraints()
//        }
        mainView.keyBoardShowConstraints(keyBoardHeight: keyboardHeight)
    }
    
    @objc func keyboardWillHide() {
        mainView.keyBoardHiddenConstraints()
    }
}

extension PosterDetailViewController: UITableViewDelegate {
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
