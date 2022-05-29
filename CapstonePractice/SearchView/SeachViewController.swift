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
    
    let pickerCategoryList = ["DP", "자료구조", "그래프", "구현", "Greedy"]
    let pickerList = ["1", "2" ,"3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"
                      ,"23", "24", "25", "26", "27", "28", "29", "30"
    ]
    
    var selectedCategory = ""
    var selectedLevel = ""
    
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
        mainView.categotySelectionButton.addTarget(self, action: #selector(categotyButtonClciked), for: .touchUpInside)
        mainView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        
        mainView.pickerView.delegate = self
        mainView.pickerView.dataSource = self
        
    }
    
    @objc func searchButtonClicked() {
        var searchText = ""
        
        if selectedCategory == "DP" {
            searchText = "dp"
        } else if selectedCategory == "자료구조" {

            searchText = "data_structures"
        } else if selectedCategory == "Greedy" {

            searchText = "Greedy"
        } else if selectedCategory == "그래프" {

            searchText = "graphs"
        }  else if selectedCategory == "구현" {

            searchText = "implementation"
        }

        
        ApiService.searchProblem(pageNum: 0, category: searchText, level: selectedLevel) { searchedData in
            self.searched = searchedData.data

            ApiService.searchProblem(pageNum: 1, category: searchText, level: self.selectedLevel) { searchedDat in
                self.searched = self.searched + searchedDat.data

                ApiService.searchProblem(pageNum: 2, category: searchText, level: self.selectedLevel) { searchedDa in
                    self.searched = self.searched + searchedDa.data

                    DispatchQueue.main.async {
                        self.mainView.tableView.reloadData()
                        }
                }
            }
        }
    }
    
    @objc func categotyButtonClciked() {

        let alertVC = UIAlertController(title: "문제의 난의도를 선택해주세요", message: "1~30까지 있습니다\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        
        
        let pickerView = UIPickerView(frame: CGRect(x: 55, y: 45, width: 250, height: 150))
        
        
        pickerView.delegate = self
        pickerView.dataSource = self
        alertVC.view.addSubview(pickerView)
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertVC.addAction(cancelButton)
        present(alertVC, animated: true, completion: nil)
        
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
    var searched: [searchedDatum] = []
}

extension SeachViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // 검색 정보 활용하면 될듯
        
        
        if let searchText = searchBar.text, let level = mainView.levelButton.titleLabel?.text {
            print(searchText)
            if level.count > 2 {
                ApiService.searchProblem(pageNum:0, category: searchText, level: "5") { searchedData in
                    self.searched = searchedData.data
                    
                    DispatchQueue.main.async {
                        self.mainView.tableView.reloadData()
                        }
                }
            }else {
                ApiService.searchProblem(pageNum:0, category: searchText, level: level) { searchedData in
                    self.searched = searchedData.data
                    
                    DispatchQueue.main.async {
                        self.mainView.tableView.reloadData()
                        }
                }
            }
            
        }
        
    }
    
}


extension SeachViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
//    didsele
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if component == 0 {
            selectedCategory = pickerCategoryList[row]
        }else {
            selectedLevel = pickerList[row]
        }
        
        mainView.selectedKeyWordsLabel.text = "검색어: \(selectedCategory)" + "   단계: \(selectedLevel)"
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        30
    }

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return self.pickerCategoryList.count
        }else {
            return self.pickerList.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return pickerCategoryList[row]
        }else {
            return pickerList[row]
        }
           
   }
    
}

extension SeachViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searched.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProblemTableViewCell.identifier, for: indexPath) as? ProblemTableViewCell else {
            return UITableViewCell()
        }
        cell.keyLabel.text = searched[indexPath.row].categories[0]
        cell.titleLabel.text = searched[indexPath.row].name
        cell.numberLabel.text = "\(searched[indexPath.row].id)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SpecificProblemViewController()
        vc.problemType = searched[indexPath.row].categories[0]
        vc.problemTitle = searched[indexPath.row].name
        vc.problemNumbeer = searched[indexPath.row].id

        self.present(vc, animated: true, completion: nil)
    }
}
