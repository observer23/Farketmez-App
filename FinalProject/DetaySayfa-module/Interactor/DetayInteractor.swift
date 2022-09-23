//
//  DetayInteractor.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import Foundation
import Alamofire

var sepetteOlan=[String:String]()

var a = String()
class DetayInteractor:PresenterToInteractorDetayProtocol{
    func sepeteEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        
        let param:Parameters=["yemek_adi":yemek_adi,"yemek_resim_adi":yemek_resim_adi,"yemek_fiyat":yemek_fiyat,"yemek_siparis_adet":yemek_siparis_adet,"kullanici_adi":kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: param).response{response in
            if let data=response.data{
                do{
                    if let cevap=try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        print("Cevap:\(cevap)")
                        
                        
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}
