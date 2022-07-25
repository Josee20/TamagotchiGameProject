//
//  SelectTamagotchiCollectionCollectionViewController.swift
//  TamagotchiGameProject
//
//  Created by 이동기 on 2022/07/22.
//

import UIKit
import Toast

class SelectTamagotchiCollectionViewController: UICollectionViewController {

    var tamagotchiList = TamagotchiInfo()
    var navigationTitle = "다마고치 선택하기"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        
        navigationItem.title = "\(navigationTitle)"
        
        view.backgroundColor = UIColor.init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        UserDefaults.standard.set("대장", forKey: "nickName")
    }
    
    func setLayout() {
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 20
        let width = UIScreen.main.bounds.width - (space * 4)
        
        layout.itemSize = CGSize.init(width: width / 3, height: width / 2.3)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        
        collectionView.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectTamagotchiCollectionViewCell.identifier, for: indexPath) as! SelectTamagotchiCollectionViewCell
        
        let data = tamagotchiList.info[indexPath.row]
        cell.selTamagotchiData(data: data)        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tamagotchiList.info.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "SelectTamagotchi", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
        
        if navigationTitle == "다마고치 선택하기" {
            vc.startButtonText = "시작하기"
        } else if navigationTitle == "다마고치 변경하기" {
            vc.startButtonText = "변경하기"
        }
        
        if indexPath.row < 3 {
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true, completion: nil)
            vc.popUpDamagotchiImageView.image = tamagotchiList.info[indexPath.row].tamagotchiImageView
            vc.popUpDamagotchiName.text = tamagotchiList.info[indexPath.row].name
            vc.popUpDamagotchiOverView.text = tamagotchiList.info[indexPath.row].overview
        } else {
            self.view.makeToast("준비중인 다마고치입니다",duration: 3.0, position: .center)
            return
        }
    }
    
    
}
