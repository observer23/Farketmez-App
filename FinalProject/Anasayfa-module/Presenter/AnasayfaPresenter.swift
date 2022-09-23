//
//  AnasayfaPresenter.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import Foundation

class AnasayfaPresenter:ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func tumYemekleriYukle() {
        anasayfaInteractor?.tumYemekleriAl()
    }
    
    
}

extension AnasayfaPresenter:InteractorToPresenterAnasayfaProtocol{
    func presenteraVeriGonder(yemeklerListesi: Array<Yemekler>) {
        anasayfaView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
    
    
}
