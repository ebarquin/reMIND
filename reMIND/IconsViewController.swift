//
//  IconsViewController.swift
//  reMIND
//
//  Created by Eugenio Barquín on 29/12/16.
//  Copyright © 2016 Eugenio Barquín. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class IconsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var iconsList : [[String : String]] = [[String : String]] ()
    
    var icons : Array <String> = Array<String>()
    
    var headerTitleString : String?
    
    var selectedTask : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iconsList.append(["icon": "img_icono_compra", "title": "compra"])
        iconsList.append(["icon": "img_icono_economia", "title": "Economía"])
        iconsList.append(["icon": "img_icono_amor", "title": "Amor"])
        iconsList.append(["icon": "img_icono_amigos", "title": "Amigos"])
        iconsList.append(["icon": "img_icono_lugares", "title": "Lugares"])
        iconsList.append(["icon": "img_icono_fechas", "title": "Fechas"])
        iconsList.append(["icon": "img_icono_webs", "title": "Webs"])
        iconsList.append(["icon": "img_icono_archivos", "title": "Archivos"])
        iconsList.append(["icon": "img_icono_musica", "title": "Música"])
        iconsList.append(["icon": "img_icono_vacaciones", "title": "Vacaciones"])
        iconsList.append(["icon": "img_icono_ideas", "title": "Ideas"])
        iconsList.append(["icon": "img_icono_deportes", "title": "Deportes"])
        
    }
    
    //Implementamos los métodos de la collectionView
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconsList.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath)
        
        let icon = iconsList[indexPath.row]
        
        if let cell = cell as? IconCell {
            
            if let icon = icon["icon"] {
                cell.icon.image = UIImage(named: icon)
            }
            if let title = icon["title"] {
                cell.title.text = title
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
        
        headerView.taskName.text = headerTitleString
        
        return headerView
    }
   
    //Forzamos a que siempre se presenten en 3 columnas
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let icon = iconsList[indexPath.row]
        
        if let selectedTask = selectedTask {
            TaskManager.shareInstance.tasks[selectedTask]["icon"] = icon["icon"]
            let _ = navigationController?.popViewController(animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxWidth = collectionView.frame.size.width/3.5
        
        return CGSize(width: maxWidth, height: maxWidth)
    }

}
