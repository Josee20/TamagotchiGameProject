//
//  TamagotchiState.swift
//  TamagotchiGameProject
//
//  Created by 이동기 on 2022/07/25.
//

import Foundation
import UIKit

struct TamagotchiState {
    static var nickName: String = "대장"
    var rice: Int = 0
    var water: Int = 0
    var level: Int {
        get {
            let exp: Int = (rice / 5) + (water / 2)
            if exp < 0 {
                return 0
            } else if exp < 20 {
                return 1
            } else if exp < 30 {
                return 2
            } else if exp < 40 {
                return 3
            } else if exp < 50 {
                return 4
            } else if exp < 60 {
                return 5
            } else if exp < 70 {
                return 6
            } else if exp < 80 {
                return 7
            } else if exp < 90 {
                return 8
            } else if exp < 100 {
                return 9
            } else {
                return 10
            }
        }
    }
    var sayScript: String {
        get {
            let script: [String] = ["목말라요~~~~~", "배고파요 ㅠㅠ 밥 먹고싶어요", "오늘은 왠지 기분이 좋네요", "테이블뷰컨트롤러와 뷰컨트롤러는 어떤 차이가 있을까요?", "\(TamagotchiState.nickName)님 오늘 과제는 하셨어요", "\(TamagotchiState.nickName)님 오늘 복습 제대로 하신거 맞죠?ㅎㅎ", "좋은 날씨네요!!!", "\(TamagotchiState.nickName)님도 고생 많으셨어요!!!"]
            
            return script[Int.random(in: 0...7)]
        }
    }
    var canNotEat: String = "토할거가타요ㅠㅁㅠ"
}
