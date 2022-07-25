//
//  SettingScreenTableViewController.swift
//  TamagotchiGameProject
//
//  Created by 이동기 on 2022/07/23.
//

import UIKit

enum tableSet: Int, CaseIterable {
    
    case a
    
    var rowTitle: [String] {
        switch self {
        case.a:
            return ["내 이름 설정하기", "다마고치 변경하기", "데이터 초기화"]
        }
    }
    
    var rowImage: [UIImage] {
        switch self {
        case.a:
            return [UIImage(systemName: "pencil")!, UIImage(systemName: "moon.fill")!, UIImage(systemName: "arrow.clockwise")!]
        }
    }
    
    var rowDetailTextLabel: [String] {
        switch self {
        case.a:
            return ["\(UserDefaults.standard.value(forKey: "nickName") as! String)", "", ""]
        }
    }
}

class SettingScreenTableViewController: UITableViewController {

    @IBOutlet weak var divideLine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "설정"
        
        view.backgroundColor = .init(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "chevron.backward")
        
        // 왜 뒤로가기 하면 타이틀이 사라지는 것인가
        self.navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        divideLine.layer.borderWidth = 1
        divideLine.layer.borderColor = UIColor.init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingScreenTableViewCell.identifier)!
        
        cell.textLabel?.text = tableSet.allCases[indexPath.section].rowTitle[indexPath.row]
        cell.imageView?.image = tableSet.allCases[indexPath.section].rowImage[indexPath.row]
        cell.detailTextLabel?.text = tableSet.allCases[indexPath.section].rowDetailTextLabel[indexPath.row]
        
        cell.tintColor = .init(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableSet.allCases[section].rowTitle.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let sb = UIStoryboard(name: "SetNameScreen", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SetNameViewController") as! SetNameViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 {
            let sb = UIStoryboard(name: "SelectTamagotchi", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SelectTamagotchiCollectionViewController") as! SelectTamagotchiCollectionViewController
 
            vc.navigationTitle = "다마고치 변경하기"
            
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 2 {
            let sb = UIStoryboard(name: "SelectTamagotchi", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "SelectTamagotchiCollectionViewController") as! SelectTamagotchiCollectionViewController
            let nav = UINavigationController(rootViewController: vc)
            
            nav.modalPresentationStyle = .fullScreen
            nav.modalTransitionStyle = .crossDissolve
            
            let alert = UIAlertController.init(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "아냐!", style: .cancel, handler: nil)
            let ok = UIAlertAction(title: "웅", style: .default, handler: { _ in return self.present(nav, animated: true)})
            
            alert.addAction(cancel)
            alert.addAction(ok)
            
            present(alert, animated: true, completion: nil)
        }
    }
}
