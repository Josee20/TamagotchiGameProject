//
//  SelectTamagotchiCollectionCollectionViewController.swift
//  TamagotchiGameProject
//
//  Created by 이동기 on 2022/07/22.
//

import UIKit

class SelectTamagotchiCollectionCollectionViewController: UICollectionViewController {

    var tamagotchiList = TamagotchiInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        
        navigationItem.title = "다마고치 선택하기"
        
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
        let vc = sb.instantiateViewController(withIdentifier: "PopUpViewController")
        
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
}
