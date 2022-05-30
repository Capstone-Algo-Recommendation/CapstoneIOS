//
//  SolvedProblemViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/26.
//

import UIKit
import RxSwift
import RxCocoa

class SolvedProblemViewController: UIViewController {
    
    let mainView = SolvedProblemView()

    let disposeBag = DisposeBag()
    var items: [ProblemList] = []
    var filterdItems: [ProblemList] = []
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    private func loadData() {
        

        ApiService.getInfoFromServer(pageNum: 1) { problems in
            
            for problem in problems {
                if problem.status == "COMPLETE" {
                    self.items.append(problem)
                    self.filterdItems.append(problem)
                }
            }
            
            DispatchQueue.main.async {
                self.mainView.tableView.reloadData()
            }
            
            
        }
        
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        title = "성공한 문제"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "필터", style: .plain, target: self, action: #selector(filterProblems))
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
//        getInfoFromServer
  
        

    }
}


extension SolvedProblemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterdItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProblemTableViewCell.identifier, for: indexPath) as? ProblemTableViewCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = filterdItems[indexPath.row].name
        cell.numberLabel.text = "문제 번호: \(filterdItems[indexPath.row].id)"
        cell.keyLabel.text = filterdItems[indexPath.row].categories[0]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = SpecificProblemViewController()
        vc.problemTitle = filterdItems[indexPath.row].name
//        vc.problemInfo = filterdItems[indexPath.row]
        vc.problemType = filterdItems[indexPath.row].categories[0]
        vc.problemNumbeer = filterdItems[indexPath.row].id
        self.present(vc, animated: true, completion: nil)
        
    }
}


extension SolvedProblemViewController {
    @objc func filter(keyword: String) {
        
        filterdItems = items.filter { it in
            for tag in it.categories{
                if tag == keyword{
                    return true
                }
            }
            return false
        }
        mainView.tableView.reloadData()
    }

    
    @objc func filterProblems() {
        let alertVC = UIAlertController(title: "보고 싶은 알고리즘을 선택해주세요", message: "", preferredStyle: .alert)
        
        
        let allButton = UIAlertAction(title: "전체", style: .default, handler: { _ in
            self.filterdItems = self.items
            self.mainView.tableView.reloadData()
        })
        
        let dpButton = UIAlertAction(title: "다이나믹 프로그래밍", style: .default, handler: { _ in
            self.filter(keyword: "dp")
        })
        let dataStructureButton = UIAlertAction(title: "자료구조", style: .default, handler: { _ in
            self.filter(keyword: "data_structures")
        })
        let graphButton = UIAlertAction(title: "그래프", style: .default, handler: { _ in
            self.filter(keyword: "graphs")
        })
        let implementationButton = UIAlertAction(title: "구현", style: .default, handler: { _ in
            self.filter(keyword: "implementation")
        })
        let greedyButton = UIAlertAction(title: "그리디", style: .default, handler: { _ in
            self.filter(keyword: "greedy")
        })
        let etcButton = UIAlertAction(title: "기타", style: .default, handler: { _ in
            self.filter(keyword: "dp")
        })
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertVC.addAction(allButton)
        alertVC.addAction(dpButton)
        alertVC.addAction(dataStructureButton)
        alertVC.addAction(graphButton)
        alertVC.addAction(implementationButton)
        alertVC.addAction(greedyButton)
        alertVC.addAction(etcButton)
        alertVC.addAction(cancelButton)
        
        present(alertVC, animated: true, completion: nil)
        
    }
}
