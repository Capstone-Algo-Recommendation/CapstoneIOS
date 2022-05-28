//
//  PosterViewModel.swift
//  CapstonePractice
//
//  Created by Yundong Lee on 2022/03/25.
//

import Foundation
import RxSwift

struct Poster {
    let title: String
    let content: String
    let writtenDate: String
    let like: String
}

class PosterViewModel {
    
    var items = Observable.just([
        Poster(title: "다이어터의 만찬", content: "로제 찜딹 대 황올", writtenDate: "03/02", like: "2"),
        Poster(title: "가족이 코로나 걸림", content: "나도 목좀 아프고 해서 pcr검사받으려는데 1시간뒤 수업있음 어캐?", writtenDate: "03/04", like: "2"),
        Poster(title: "경영학부 사물함 돈내고 쓰나요?", content: "학생회비 안 냈는데, 돈 내고 쓰나요?", writtenDate: "03/21", like: "2"),
        Poster(title: "젠더교육 문제 및 정답 족보", content: "젠더교육 문제 및 정답 족보 올려드립니다. 올해 특징 -3번까지 더 안보임", writtenDate: "201", like: "2"),
        Poster(title: "말도 안되게 자는날", content: "전날 8시부터 지금까지 잤는데 하필 이런 날에 썸녀한테 카톡이 오냐 말이 됨?", writtenDate: "03/11", like: "2"),
        Poster(title: "출석", content: "결석 한 번은 괜찮나요... 1교신데 지금 방금 일어나버림 ㅠ", writtenDate: "03/17", like: "2"),
        Poster(title: "아 이제 집중력 끝났어...", content: "남은 시간 아직 한시간...", writtenDate: "03/11", like: "2"),
        Poster(title: "군대 불침번", content: "왜 육군만 함 짜증남 진짜, 해군 안하는거 같은데, 사실 난 모름 ", writtenDate: "03/11", like: "2"),
        Poster(title: "아이폰 아이패드 기본앱.", content: "기본으로 있으면 좋을만한 어플들 알려주3", writtenDate: "03/22", like: "2")

    ])
    
    var it: [Datum] = []
    
    var pageNumber = 0
    func loadPosts(competion: @escaping ()-> Void) {

        ApiService.getPostBoard(pageNum: pageNumber) { datum in
            self.pageNumber += 1
//            self.it = self.it + datum
            self.it = datum
            competion()
        }
    }
}
