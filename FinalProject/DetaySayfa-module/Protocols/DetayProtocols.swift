//
//  DetayProtocols.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import Foundation

protocol ViewToPresenterDetayProtocol{
    
    var detayInteractor:PresenterToInteractorDetayProtocol?{get set}
    func sepeteAt(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_siparis_adet:String,kullanici_adi:String)
       
}

protocol PresenterToInteractorDetayProtocol{
    
    func sepeteEkle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_siparis_adet:String,kullanici_adi:String)
    
}


protocol PresenterToRouterDetayProtocol{
    static func createModule(ref:DetayVC)
}
