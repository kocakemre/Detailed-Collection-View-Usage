//
//  ViewController.swift
//  DetayliCollectionViewKullanimi
//
//  Created by Emre Koçak on 8.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var filmCollectionView: UICollectionView!
    
    var filmlerListe = [Filmler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let f1 = Filmler(film_id: 1, film_ad: "Django", film_resim_ad: "django", film_fiyat: 14.99)
        let f2 = Filmler(film_id: 2, film_ad: "Inception", film_resim_ad: "inception", film_fiyat: 8.99)
        let f3 = Filmler(film_id: 3, film_ad: "Interstellar", film_resim_ad: "interstellar", film_fiyat: 34.99)
        let f4 = Filmler(film_id: 4, film_ad: "Anadoluda", film_resim_ad: "anadoluda", film_fiyat: 10.99)
        let f5 = Filmler(film_id: 5, film_ad: "The Heteful Eight", film_resim_ad: "thehatefuleight", film_fiyat: 11.99)
        let f6 = Filmler(film_id: 6, film_ad: "The Pianist", film_resim_ad: "thepianist", film_fiyat: 12.99)
        
        filmlerListe.append(f1)
        filmlerListe.append(f2)
        filmlerListe.append(f3)
        filmlerListe.append(f4)
        filmlerListe.append(f5)
        filmlerListe.append(f6)
        
        filmCollectionView.delegate = self
        filmCollectionView.dataSource = self
        
        let genislik = filmCollectionView.frame.size.width
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        let itemGenislik = (genislik-30)/2
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.78)
        filmCollectionView.collectionViewLayout = tasarim
        
        
    }
    
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, HucreProtocol {
    
    func buttonTiklandi(indexPath: IndexPath) {
        let film = filmlerListe[indexPath.row]
        print("Sepete Eklenen Film : \(film.film_ad!)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListe.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let film = filmlerListe[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! FilmCollectionViewCell
        
        cell.filmImageView.image = UIImage(named: film.film_resim_ad!)
        cell.filmAdLabel.text = film.film_ad
        cell.filmFiyatLabel.text = "\(film.film_fiyat!) ₺"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: film)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let film = sender as? Filmler
            let gidilecekVC = segue.destination as! DetayVC
            gidilecekVC.film = film
        }
    }
    
}
