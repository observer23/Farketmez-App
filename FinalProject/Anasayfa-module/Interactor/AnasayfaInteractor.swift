//
//  AnasayfaInteractor.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import Foundation
import Alamofire

class AnasayfaInteractor:PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumYemekleriAl() {
        
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method:.get).response{response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                    if let liste = cevap.yemekler{
                        //let liste2 = try liste.sorted{ $0.yemek_fiyat! < $1.yemek_fiyat! }
                        self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                    }
                    
                }catch{
                        print(error.localizedDescription)
                    }
            }
        }
    }
}
