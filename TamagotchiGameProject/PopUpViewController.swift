//
//  PopUpViewController.swift
//  TamagotchiGameProject
//
//  Created by 이동기 on 2022/07/22.
//

import UIKit

class PopUpViewController: UIViewController {

    
    
    @IBOutlet weak var popUpDamagotchiImageView: UIImageView!
    @IBOutlet weak var popUpDamagotchiName: UILabel!
    @IBOutlet weak var popUpDamagotchiOverView: UILabel!
    
    @IBOutlet weak var popUpCancelButton: UIButton!
    @IBOutlet weak var popUpStartButton: UIButton!
    
    @IBOutlet weak var bottomLine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        popUpButtonStyle()
        bottomLineStyle()
        popUpDamagotchiNameStyle()
        popUpDamagotchiOverviewStyle()
        
        
    }
    
    func popUpDamagotchiOverviewStyle() {
        popUpDamagotchiOverView.text = """
            저는 선인장 다마고치 입니다. 키는 2cm
            몸무게는 150g이에요.
            성격은 소심하지만 마음은 따뜻해요.
            열심히 잘 먹고 잘 클 자신은 있답니다.
            반가워요 주인님!!!
        """
        popUpDamagotchiOverView.numberOfLines = 5
        popUpDamagotchiOverView.font = .systemFont(ofSize: 13)
        popUpDamagotchiOverView.textColor = .systemGray
        popUpDamagotchiOverView.textAlignment = .center
    }
    
    func popUpDamagotchiNameStyle() {
        popUpDamagotchiName.textColor = .systemGray
        popUpDamagotchiName.font = .systemFont(ofSize: 13)
        popUpDamagotchiName.layer.borderWidth = 1
        popUpDamagotchiName.layer.borderColor = UIColor.systemGray.cgColor
        popUpDamagotchiName.layer.cornerRadius = 5
        popUpDamagotchiName.textAlignment = .center
    }
    
    func popUpButtonStyle() {
        popUpCancelButton.setTitle("취소", for: .normal)
        popUpCancelButton.setTitleColor(.systemGray, for: .normal)
        popUpCancelButton.layer.borderWidth = 1
        popUpCancelButton.layer.borderColor = UIColor.systemGray4.cgColor
        
        popUpStartButton.setTitle("시작하기", for: .normal)
        popUpStartButton.setTitleColor(.systemGray, for: .normal)
        popUpStartButton.layer.borderWidth = 1
        popUpStartButton.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    func bottomLineStyle() {
        bottomLine.layer.borderWidth = 1
        bottomLine.layer.borderColor = UIColor.systemGray.cgColor
    }
    
    
    
}
