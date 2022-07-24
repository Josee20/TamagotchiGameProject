//
//  TamagotchiState.swift
//  TamagotchiGameProject
//
//  Created by 이동기 on 2022/07/25.
//

import Foundation
import UIKit

struct TamagotchiState {
    var rice: Int
    var water: Int
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
    var sayScript: [String] = ["목말라요~~~~~", "배고파요 ㅠㅠ 밥 먹고싶어요", "오늘은 왠지 기분이 좋네요", "테이블뷰컨트롤러와 뷰컨트롤러는 어떤 차이가 있을까요?", "nickname님 오늘 과제는 하셨어요", "nickname님 오늘 복습 제대로 하신거 맞죠?ㅎㅎ", "좋은 날씨네요!!!"]
    var canNotEat: String = "토할거가타요ㅠㅁㅠ"
    var tamaImageArr1: [String] = ["1-1", "1-2", "1-3", "1-4", "1-5", "1-6", "1-7", "1-8", "1-9", "1-9"]
    var tamaImageArr2: [String] = ["2-1", "2-2", "2-3", "2-4", "2-5", "2-6", "2-7", "2-8", "2-9", "2-9"]
    var tamaImageArr3: [String] = ["3-1", "3-2", "3-3", "3-4", "3-5", "3-6", "3-7", "3-8", "3-9", "3-9"]
}
