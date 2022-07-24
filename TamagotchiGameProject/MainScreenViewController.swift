//
//  MainScreenViewController.swift
//  TamagotchiGameProject
//
//  Created by 이동기 on 2022/07/23.
//

import UIKit

class MainScreenViewController: UIViewController {

    @IBOutlet var divideLine: UIView!
    
    @IBOutlet weak var eatRiceButton: UIButton!
    @IBOutlet weak var drinkWaterButton: UIButton!
    
    @IBOutlet weak var mainScreenBottomLine1: UIView!
    @IBOutlet weak var mainScreenBottomLine2: UIView!
    
    @IBOutlet weak var eatRiceTextField: UITextField!
    @IBOutlet weak var drinkWaterTextField: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)

        self.navigationItem.title = "대장님의 다마고치"
                
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(moveSettingScreen))
        
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        mainScreenButtonStyle()
        lineStyle()
        
        eatRiceTextField.layer.borderWidth = 1
        eatRiceTextField.layer.borderColor = UIColor.init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1).cgColor
        eatRiceTextField.placeholder = "밥주세용"
        eatRiceTextField.textAlignment = .center
        eatRiceTextField.backgroundColor = .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
       
        drinkWaterTextField.layer.borderWidth = 1
        drinkWaterTextField.layer.borderColor = UIColor.init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1).cgColor
        drinkWaterTextField.placeholder = "물주세용"
        drinkWaterTextField.textAlignment = .center
        drinkWaterTextField.backgroundColor = .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }
        
    
    @objc func moveSettingScreen() {
        let sb = UIStoryboard(name: "SettingScreen", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingScreenTableViewController") as! SettingScreenTableViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func lineStyle() {
        mainScreenBottomLine1.layer.borderWidth = 1
        mainScreenBottomLine1.layer.borderColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        mainScreenBottomLine2.layer.borderWidth = 1
        mainScreenBottomLine2.layer.borderColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        divideLine.layer.borderWidth = 2
        divideLine.layer.borderColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
    }
    
    func mainScreenButtonStyle() {
        eatRiceButton.layer.borderWidth = 1
        eatRiceButton.layer.borderColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        eatRiceButton.setTitle("밥먹기", for: .normal)
        eatRiceButton.setTitleColor(UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        eatRiceButton.tintColor = .init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        eatRiceButton.layer.cornerRadius = 7
        
        drinkWaterButton.layer.borderWidth = 1
        drinkWaterButton.layer.borderColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        drinkWaterButton.setTitle("물먹기", for: .normal)
        drinkWaterButton.setTitleColor(UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        drinkWaterButton.tintColor = .init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        drinkWaterButton.layer.cornerRadius = 7
    }
}
