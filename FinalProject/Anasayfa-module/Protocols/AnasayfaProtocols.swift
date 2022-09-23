//
//  AnasayfaProtocols.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import Foundation


protocol ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol?{get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol?{get set}
    
    
    func tumYemekleriYukle()
    
}
protocol PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?{get set}
    
    func tumYemekleriAl()

}


// Taşıyıcı Protocolller

protocol InteractorToPresenterAnasayfaProtocol{
    func presenteraVeriGonder(yemeklerListesi:Array<Yemekler>)
    
}

protocol PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(yemeklerListesi:Array<Yemekler>)
}

//Router protocol

protocol PresenterToRouterAnasayfaProtocol{
    static func createModule(ref:AnasayfaVC)
}
