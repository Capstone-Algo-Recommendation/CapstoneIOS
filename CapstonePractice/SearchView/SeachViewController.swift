//
//  SeachViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/05/20.
//

import Foundation
import UIKit

class SeachViewController: UIViewController {
    
    let mainView = SearchView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "문제 검색 "
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.seachBar.delegate = self
        mainView.seachBar.placeholder = "문제를 검색해주세요"
        mainView.tableView.keyboardDismissMode = .onDrag
    }
}

extension SeachViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // 검색 정보 활용하면 될듯
        
        if let searchText = searchBar.text {
            ApiService.searchProblem(query: searchText) { _ in
                print("G")
            }
        }
        
    }
}

extension SeachViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProblemTableViewCell.identifier, for: indexPath) as? ProblemTableViewCell else {
            return UITableViewCell()
        }
        cell.keyLabel.text = "dp"
        cell.titleLabel.text = "SADf"
        cell.numberLabel.text = "2515"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SpecificProblemViewController()
//        vc.problemTitle = filterdItems[indexPath.row].titleKo
//        vc.problemInfo = filterdItems[indexPath.row]
        vc.problemTitle = "ttt"
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
