//
//  SepetPresenter.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import Foundation


class SepetPresenter:ViewToPresenterSepetProtocol{
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
    var sepetView: PresenterToViewSepetProtocol?
    
    func sepetiGetir(sepet_yemek_id: Int,kullanici_adi: String) {
        sepetInteractor?.sepetiAl(sepet_yemek_id: sepet_yemek_id,kullanici_adi: kullanici_adi)
    }
    
    func sil(sepet_yemek_id: Int, kullanici_adi: String) {
        sepetInteractor?.yemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
    
}
extension SepetPresenter:InteractorToPresenterSepetProtocol{
    func presenterVeriGonder(liste: Array<SepetYemekler>) {
        sepetView?.viewVeriGonder(liste: liste)
    }
}
