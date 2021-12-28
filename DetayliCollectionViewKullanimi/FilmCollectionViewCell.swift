//
//  FilmCollectionViewCell.swift
//  DetayliCollectionViewKullanimi
//
//  Created by Emre Koçak on 8.11.2021.
//

import UIKit

protocol HucreProtocol {
    func buttonTiklandi(indexPath:IndexPath)
}


class FilmCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var filmAdLabel: UILabel!
    @IBOutlet weak var filmFiyatLabel: UILabel!
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
        hucreProtocol?.buttonTiklandi(indexPath: indexPath!)
    }
}
