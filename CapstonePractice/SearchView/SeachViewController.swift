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
    var pickerView = UIPickerView()
    let pickerList = ["1", "2" ,"3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"
                      ,"23", "24", "25", "26", "27", "28", "29", "30"
    ]
    
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
        
        mainView.levelButton.addTarget(self, action: #selector(levelButtonTouched), for: .touchUpInside)
        
    }
    
    @objc func levelButtonTouched() {
        let alertVC = UIAlertController(title: "문제의 난의도를 선택해주세요", message: "1~30까지 있습니다\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        
        
        let pickerView = UIPickerView(frame: CGRect(x: 55, y: 45, width: 250, height: 150))
        
        
        pickerView.delegate = self
        pickerView.dataSource = self
        alertVC.view.addSubview(pickerView)
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertVC.addAction(cancelButton)
        present(alertVC, animated: true, completion: nil)
        
    }
}

extension SeachViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // 검색 정보 활용하면 될듯
        
        
        if let searchText = searchBar.text, let level = mainView.levelButton.titleLabel?.text {
            print(searchText)
            if level.count > 2 {
                ApiService.searchProblem(category: searchText, level: "5") { _ in
                    print("default level")
                }
            }else {
                ApiService.searchProblem(category: searchText, level: level) { _ in
                    print("Good level")
                }
            }
            
        }
        
    }
}


extension SeachViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mainView.levelButton.setTitle(pickerList[row] + "단계", for: .normal)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        30
    }

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return pickerList[row]
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
