//
//  SetNameViewController.swift
//  TamagotchiGameProject
//
//  Created by 이동기 on 2022/07/24.
//

import UIKit
import Toast

class SetNameViewController: UIViewController {
    
    @IBOutlet weak var setNameScreenTextLabel: UITextField!
    
    @IBOutlet var setScreenBottomLine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        setNameScreenTextLabel.layer.borderWidth = 1
        setNameScreenTextLabel.layer.borderColor = .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        setNameScreenTextLabel.backgroundColor = .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        setNameScreenTextLabel.placeholder = "닉네임을 설정해주세요"
        
        setScreenBottomLine.layer.borderWidth = 2
        setScreenBottomLine.layer.borderColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
    }
    
    @objc func saveButtonClicked() {
        if setNameScreenTextLabel.text!.count < 2 || setNameScreenTextLabel.text!.count > 6 {
            self.view.makeToast("2글자 이상 6글자 이하의\n 닉네임만 가능합니다", duration: 3.0, position: .center)
            setNameScreenTextLabel.text = ""
        } else {
            UserDefaults.standard.set("\(setNameScreenTextLabel.text!)", forKey: "nickName")
            self.navigationController?.popViewController(animated: true)
        }
    }
}
