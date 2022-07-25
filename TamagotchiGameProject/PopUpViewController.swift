//
//  PopUpViewController.swift
//  TamagotchiGameProject
//
//  Created by 이동기 on 2022/07/22.
//

import UIKit

class PopUpViewController: UIViewController {
    
    // 상속받는 상위클래스(UICollectionViewController, UIViewController에 차이가 있으면 다른 클래스안에서 초기화가 불가능한가?
    // var initSelectTamagotchiCollectionViewController = SelectTamagotchiCollectionViewController()
    
    var startButtonText = ""
    
    @IBOutlet weak var popUpDamagotchiImageView: UIImageView!
    @IBOutlet weak var popUpDamagotchiName: UILabel!
    @IBOutlet weak var popUpDamagotchiOverView: UILabel!
    
    @IBOutlet weak var popUpCancelButton: UIButton!
    @IBOutlet weak var popUpStartButton: UIButton!
    
    @IBOutlet weak var bottomLine: UIView!
    
    @IBOutlet weak var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        popUpButtonStyle()
        bottomLineStyle()
        popUpDamagotchiNameStyle()
        popUpDamagotchiOverviewStyle()
        
        popUpView.layer.cornerRadius = 10
    }
    
    func popUpDamagotchiOverviewStyle() {
        popUpDamagotchiOverView.numberOfLines = 5
        popUpDamagotchiOverView.font = .systemFont(ofSize: 13)
        popUpDamagotchiOverView.textColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        popUpDamagotchiOverView.textAlignment = .center
    }
    
    func popUpDamagotchiNameStyle() {
        popUpDamagotchiName.textColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        popUpDamagotchiName.font = .systemFont(ofSize: 13)
        popUpDamagotchiName.layer.borderWidth = 1
        popUpDamagotchiName.layer.borderColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        popUpDamagotchiName.layer.cornerRadius = 5
        popUpDamagotchiName.textAlignment = .center
    }
    
    func popUpButtonStyle() {
        popUpCancelButton.setTitle("취소", for: .normal)
        popUpCancelButton.setTitleColor(UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        popUpCancelButton.layer.borderWidth = 1
        popUpCancelButton.layer.borderColor = UIColor.systemGray4.cgColor
        popUpCancelButton.backgroundColor = .systemGray6
        popUpCancelButton.layer.cornerRadius = 8
        popUpCancelButton.clipsToBounds = true
        
        popUpStartButton.setTitle("\(startButtonText)", for: .normal)
        popUpStartButton.setTitleColor(UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        popUpStartButton.layer.borderWidth = 1
        popUpStartButton.layer.borderColor = UIColor.systemGray4.cgColor
        popUpStartButton.layer.cornerRadius = 8
        popUpStartButton.clipsToBounds = true
    }
    
    func bottomLineStyle() {
        bottomLine.layer.borderWidth = 1
        bottomLine.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
        
        if startButtonText == "시작하기" {
            UserDefaults.standard.removeObject(forKey: "riceValue")
            UserDefaults.standard.removeObject(forKey: "waterValue")
            
        }
        
        let sb = UIStoryboard(name: "MainScreen", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainScreenViewController") as! MainScreenViewController
        
        vc.tamagotchiName = popUpDamagotchiName.text!
        UserDefaults.standard.set(vc.tamagotchiName, forKey: "tamagotchiNameValue")
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false)
        
        
    }
}
