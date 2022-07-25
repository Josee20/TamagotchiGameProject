//
//  MainScreenViewController.swift
//  TamagotchiGameProject
//
//  Created by 이동기 on 2022/07/23.
//

import UIKit


class MainScreenViewController: UIViewController {

    var tamagotchiState = TamagotchiState()
    var tamagotchiName = ""
    
    @IBOutlet var divideLine: UIView!
    
    @IBOutlet weak var eatRiceButton: UIButton!
    @IBOutlet weak var drinkWaterButton: UIButton!
    
    @IBOutlet weak var mainScreenBottomLine1: UIView!
    @IBOutlet weak var mainScreenBottomLine2: UIView!
    
    @IBOutlet weak var eatRiceTextField: UITextField!
    @IBOutlet weak var drinkWaterTextField: UITextField!
    
    @IBOutlet weak var mainScreenTamagotchiName: UILabel!
    @IBOutlet weak var mainScreenTamagotchInfo: UILabel!
    @IBOutlet weak var mainScreenTamagotchiScriptLabel: UILabel!
    
    @IBOutlet weak var mainScreenTamagotchiImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(moveSettingScreen))
        
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        mainScreenButtonStyle()
        lineStyle()
        textFieldStyle()
        
        mainScreenTamagotchiScriptLabel.numberOfLines = 0
        mainScreenTamagotchiName.text = UserDefaults.standard.string(forKey: "tamagotchiNameValue")
        
        imageSetWithLevel()
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let name = UserDefaults.standard.value(forKey: "nickName") as! String
        self.navigationItem.title = "\(name)님의 다마고치"
        
        tamagotchiState.rice = UserDefaults.standard.integer(forKey: "riceValue")
        tamagotchiState.water = UserDefaults.standard.integer(forKey: "waterValue")

        mainScreenTamagotchInfo.font = .systemFont(ofSize: 14)
        mainScreenTamagotchInfo.text = "LV\(tamagotchiState.level) • 밥알 \(tamagotchiState.rice)개 • 물방울 \(tamagotchiState.water)개"
        
        if tamagotchiState.level < 9 {
            mainScreenTamagotchiScriptLabel.text = tamagotchiState.sayScript
        } else {
            mainScreenTamagotchiScriptLabel.text = tamagotchiState.canNotEat
        }
        
        mainScreenTamagotchiName.text = UserDefaults.standard.string(forKey: "tamagotchiNameValue")
        
        imageSetWithLevel()
    }
    
    @objc func moveSettingScreen() {
        let sb = UIStoryboard(name: "SettingScreen", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingScreenTableViewController") as! SettingScreenTableViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func textFieldStyle() {
        eatRiceTextField.layer.borderWidth = 1
        eatRiceTextField.layer.borderColor = UIColor.init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1).cgColor
        eatRiceTextField.placeholder = "밥주세용"
        eatRiceTextField.textAlignment = .center
        eatRiceTextField.backgroundColor = .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        eatRiceTextField.keyboardType = .numberPad
       
        drinkWaterTextField.layer.borderWidth = 1
        drinkWaterTextField.layer.borderColor = UIColor.init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1).cgColor
        drinkWaterTextField.placeholder = "물주세용"
        drinkWaterTextField.textAlignment = .center
        drinkWaterTextField.backgroundColor = .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        drinkWaterTextField.keyboardType = .numberPad
        
        mainScreenTamagotchiScriptLabel.textAlignment = .center
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
    
    func imageSetWithLevel() {
        if mainScreenTamagotchiName.text == "따끔따끔 다마고치" {
            if tamagotchiState.level == 1 {
                mainScreenTamagotchiImageView.image = UIImage(named: "1-1")
            } else if tamagotchiState.level == 2 {
                mainScreenTamagotchiImageView.image = UIImage(named: "1-2")
            } else if tamagotchiState.level == 3 {
                mainScreenTamagotchiImageView.image = UIImage(named: "1-3")
            } else if tamagotchiState.level == 4 {
                mainScreenTamagotchiImageView.image = UIImage(named: "1-4")
            } else if tamagotchiState.level == 5 {
                mainScreenTamagotchiImageView.image = UIImage(named: "1-5")
            } else if tamagotchiState.level == 6 {
                mainScreenTamagotchiImageView.image = UIImage(named: "1-6")
            } else if tamagotchiState.level == 7 {
                mainScreenTamagotchiImageView.image = UIImage(named: "1-7")
            } else if tamagotchiState.level == 8 {
                mainScreenTamagotchiImageView.image = UIImage(named: "1-8")
            } else if tamagotchiState.level == 9 {
                mainScreenTamagotchiImageView.image = UIImage(named: "1-9")
            } else {
                mainScreenTamagotchiImageView.image = UIImage(named: "1-9")
            }
        } else if mainScreenTamagotchiName.text == "방실방실 다마고치" {
            if tamagotchiState.level == 1 {
                mainScreenTamagotchiImageView.image = UIImage(named: "2-1")
            } else if tamagotchiState.level == 2 {
                mainScreenTamagotchiImageView.image = UIImage(named: "2-2")
            } else if tamagotchiState.level == 3 {
                mainScreenTamagotchiImageView.image = UIImage(named: "2-3")
            } else if tamagotchiState.level == 4 {
                mainScreenTamagotchiImageView.image = UIImage(named: "2-4")
            } else if tamagotchiState.level == 5 {
                mainScreenTamagotchiImageView.image = UIImage(named: "2-5")
            } else if tamagotchiState.level == 6 {
                mainScreenTamagotchiImageView.image = UIImage(named: "2-6")
            } else if tamagotchiState.level == 7 {
                mainScreenTamagotchiImageView.image = UIImage(named: "2-7")
            } else if tamagotchiState.level == 8 {
                mainScreenTamagotchiImageView.image = UIImage(named: "2-8")
            } else if tamagotchiState.level == 9 {
                mainScreenTamagotchiImageView.image = UIImage(named: "2-9")
            } else {
                mainScreenTamagotchiImageView.image = UIImage(named: "2-9")
            }
        } else if mainScreenTamagotchiName.text == "반짝반짝 다마고치" {
            if tamagotchiState.level == 1 {
                mainScreenTamagotchiImageView.image = UIImage(named: "3-1")
            } else if tamagotchiState.level == 2 {
                mainScreenTamagotchiImageView.image = UIImage(named: "3-2")
            } else if tamagotchiState.level == 3 {
                mainScreenTamagotchiImageView.image = UIImage(named: "3-3")
            } else if tamagotchiState.level == 4 {
                mainScreenTamagotchiImageView.image = UIImage(named: "3-4")
            } else if tamagotchiState.level == 5 {
                mainScreenTamagotchiImageView.image = UIImage(named: "3-5")
            } else if tamagotchiState.level == 6 {
                mainScreenTamagotchiImageView.image = UIImage(named: "3-6")
            } else if tamagotchiState.level == 7 {
                mainScreenTamagotchiImageView.image = UIImage(named: "3-7")
            } else if tamagotchiState.level == 8 {
                mainScreenTamagotchiImageView.image = UIImage(named: "3-8")
            } else if tamagotchiState.level == 9 {
                mainScreenTamagotchiImageView.image = UIImage(named: "3-9")
            } else {
                mainScreenTamagotchiImageView.image = UIImage(named: "3-9")
            }
        }
    }
    
    @IBAction func eatRiceButtonClicked(_ sender: UIButton) {
        
        if let intFromStr = Int(eatRiceTextField.text!) {
            if tamagotchiState.level < 10 {
                mainScreenTamagotchiScriptLabel.text = tamagotchiState.sayScript
            } else {
                mainScreenTamagotchiScriptLabel.text = tamagotchiState.canNotEat
                eatRiceTextField.text = ""
                return
            }
            tamagotchiState.rice += intFromStr
            
        } else if eatRiceTextField.text == "" {
            if tamagotchiState.level < 10 {
                mainScreenTamagotchiScriptLabel.text = tamagotchiState.sayScript
            } else {
                mainScreenTamagotchiScriptLabel.text = tamagotchiState.canNotEat
                eatRiceTextField.text = ""
                return
            }
            tamagotchiState.rice += 1
            
        } else {
            tamagotchiState.rice += 0
            mainScreenTamagotchiScriptLabel.text = "숫자만 입력해주세용!"
        }
        
        
        imageSetWithLevel()
        
        UserDefaults.standard.set(tamagotchiState.rice, forKey: "riceValue")
        
        mainScreenTamagotchInfo.text = "LV\(tamagotchiState.level) • 밥알 \(tamagotchiState.rice)개 • 물방울 \(tamagotchiState.water)개"
    
        eatRiceTextField.text = ""
    }
    
    @IBAction func drinkWaterButtonClicked(_ sender: UIButton) {
        
        if let intFromStr = Int(drinkWaterTextField.text!) {
            if tamagotchiState.level < 10 {
                mainScreenTamagotchiScriptLabel.text = tamagotchiState.sayScript
            } else {
                mainScreenTamagotchiScriptLabel.text = tamagotchiState.canNotEat
                drinkWaterTextField.text = ""
                return
            }
            tamagotchiState.water += intFromStr
            
        } else if drinkWaterTextField.text == ""{
            if tamagotchiState.level < 10 {
                mainScreenTamagotchiScriptLabel.text = tamagotchiState.sayScript
            } else {
                mainScreenTamagotchiScriptLabel.text = tamagotchiState.canNotEat
                drinkWaterTextField.text = ""
                return
            }
            tamagotchiState.water += 1
            
        } else {
            tamagotchiState.water += 0
            mainScreenTamagotchiScriptLabel.text = "숫자만 입력해주세용!"
        }
        
       imageSetWithLevel()
        
        UserDefaults.standard.set(tamagotchiState.water, forKey: "waterValue")
        //UserDefaults.standard.set(tamagotchiName, forKey: "tamagotchiName")
        
        mainScreenTamagotchInfo.text = "LV\(tamagotchiState.level) • 밥알 \(tamagotchiState.rice)개 • 물방울 \(tamagotchiState.water)개"
        
        drinkWaterTextField.text = ""
    
    }
    
}
