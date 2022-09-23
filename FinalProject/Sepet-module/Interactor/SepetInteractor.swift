//
//  SepetInteractor.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import Foundation
import Alamofire

class SepetInteractor:PresenterToInteractorSepetProtocol{
    
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    func sepetiAl(sepet_yemek_id: Int,kullanici_adi:String) {
        sepetteOlan.removeAll()
        let params:Parameters=["kullanici_adi":kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).response{response in
            if let data=response.data{
                do{
                    let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data)
                    var liste = [SepetYemekler]()
                    print("Burda:\(cevap)")
                    
                    liste = cevap.sepet_yemekler!
                    //let gelenliste=cevap.sepet_yemekler
                    /*if let gelenliste=cevap.sepet_yemekler     {
                        liste = gelenliste
                        /*for i in liste{
                            if sepetteOlan.keys.contains(i.yemek_adi!){
                                let eklenecekAdet = Int(i.yemek_siparis_adet!)!
                                let olanAdet = Int(sepetteOlan[i.yemek_adi!]!)
                                let toplam = eklenecekAdet+olanAdet!
                                
                                sepetteOlan.updateValue("\(toplam)", forKey: i.yemek_adi!)
                                i.yemek_siparis_adet = "\(toplam)"
                                
                            }
                            else{
                                sepetteOlan.updateValue(i.yemek_siparis_adet!, forKey:i.yemek_adi!)
                                
                            }*/
                        }
                    }*/
                    
                    //print("Sepette olan:\(sepetteOlan)")
                    self.sepetPresenter?.presenterVeriGonder(liste: liste)
                }catch{
                    print("Y?=\(error.localizedDescription)")
                    self.sepetPresenter?.presenterVeriGonder(liste: [])
                }
            }
        }
    }
    
    
    func yemekSil(sepet_yemek_id: Int, kullanici_adi: String) {
        let params:Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).response{
            response in
            if let data = response.data{
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                    self.sepetiAl(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
                    //**************************************************************//
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
}
