//
//  SelectTamagotchiCollectionViewCell.swift
//  TamagotchiGameProject
//
//  Created by 이동기 on 2022/07/22.
//

import UIKit

class SelectTamagotchiCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SelectTamagotchiCollectionViewCell"
    
    @IBOutlet weak var selectTamagotchiButton: UIButton!
    
    @IBOutlet weak var selectTamagotchiImageView: UIImageView!
    
    func selTamagotchiData(data: Tamagotchi) {
        selectTamagotchiImageView.image = data.tamagotchiImageView
        
        selectTamagotchiButton.setTitle(data.name, for: .normal)
        selectTamagotchiButton.setTitleColor(.black, for: .normal)
        selectTamagotchiButton.layer.cornerRadius = 5
        selectTamagotchiButton.layer.borderWidth = 1
        selectTamagotchiButton.layer.borderColor = UIColor.lightGray.cgColor
        selectTamagotchiButton.titleLabel?.font = .systemFont(ofSize: 12)
    }
}
