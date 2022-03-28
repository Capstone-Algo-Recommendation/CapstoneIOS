//
//  SpecificProblemViewController.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/28.
//

import UIKit

class SpecificProblemViewController: UIViewController {
    
    var problemTitle: String?
    let mainView = SpecificProblemView()
    var problemInfo: Item?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = problemTitle
        mainView.problemInfoLabel.text = problemInfo?.tags[0].key
    }
    
}
