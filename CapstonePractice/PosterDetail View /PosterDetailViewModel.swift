//
//  PosterDetailViewModel.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import Foundation
import RxSwift
import RxDataSources

class PosterDetailViewModel {
    
    let items = Observable.just([
        Poster(title: "다이어터의 만찬", content: "PosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCellPosterDetailMainCell", writtenDate: "03/02", like: "2")
    ])
    
 

}



struct SectionOfCustomData {
  var header: String
  var items: [Poster]
}


extension SectionOfCustomData: SectionModelType {
  typealias Item = Poster

   init(original: SectionOfCustomData, items: [Item]) {
    self = original
    self.items = items
  }
}

