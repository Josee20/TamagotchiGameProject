//
//  SetNameViewController.swift
//  TamagotchiGameProject
//
//  Created by 이동기 on 2022/07/24.
//

import UIKit

class SetNameViewController: UIViewController {

    @IBOutlet weak var setNameScreenTextLabel: UITextField!
    
    @IBOutlet var setScreenBottomLine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        setNameScreenTextLabel.layer.borderWidth = 1
        setNameScreenTextLabel.layer.borderColor = .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        setNameScreenTextLabel.backgroundColor = .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        setNameScreenTextLabel.placeholder = "이름을 설정해주세요"
        
        setScreenBottomLine.layer.borderWidth = 2
        setScreenBottomLine.layer.borderColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
    }
}
