//
//  DetayVC.swift
//  DetayliCollectionViewKullanimi
//
//  Created by Emre Koçak on 10.11.2021.
//

import UIKit

class DetayVC: UIViewController {
    
    @IBOutlet weak var filmResim: UIImageView!
    @IBOutlet weak var filmFiyat: UILabel!
    
    var film:Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = film {
            self.navigationItem.title = f.film_ad
            filmResim.image = UIImage(named: f.film_resim_ad!)
            filmFiyat.text = "\(f.film_fiyat!) ₺"
        }
        
        
    }
    
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let f = film {
            print("\(f.film_ad!) filmi \(f.film_fiyat!) ₺ fiyatla sepete eklendi")
        }
    }
}
