//
//  SepetProtocols.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import Foundation
//Ana protocols
protocol ViewToPresenterSepetProtocol{
    var sepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var sepetView:PresenterToViewSepetProtocol?{get set}
    
    
    func sepetiGetir(sepet_yemek_id: Int,kullanici_adi:String)
    func sil(sepet_yemek_id:Int,kullanici_adi:String)
}
protocol PresenterToInteractorSepetProtocol{
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}

    func sepetiAl(sepet_yemek_id: Int,kullanici_adi:String)
    func yemekSil(sepet_yemek_id:Int,kullanici_adi:String)
    
}

//Taşıyıcı

protocol InteractorToPresenterSepetProtocol{
    func presenterVeriGonder(liste:Array<SepetYemekler>)
}
protocol PresenterToViewSepetProtocol{
    func viewVeriGonder(liste:Array<SepetYemekler>)
}

// Router
protocol PresenterToRouterSepetProtocol{
    static func createModules(ref:SepetVC)
}

