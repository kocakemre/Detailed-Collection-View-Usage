//
//  Filmler.swift
//  DetayliCollectionViewKullanimi
//
//  Created by Emre Koçak on 8.11.2021.
//

import Foundation

class Filmler {
    
    var film_id:Int?
    var film_ad:String?
    var film_resim_ad:String?
    var film_fiyat:Double?
    
    init(){
        
    }
    
    init(film_id:Int,film_ad:String,film_resim_ad:String,film_fiyat:Double){
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_resim_ad = film_resim_ad
        self.film_fiyat = film_fiyat
    }
    
}
