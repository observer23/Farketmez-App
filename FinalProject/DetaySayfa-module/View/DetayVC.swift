//
//  DetayVC.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import UIKit
import Kingfisher
class DetayVC: UIViewController {
    @IBOutlet weak var urunAdLabel: UILabel!
    
    @IBOutlet weak var urunImageView: UIImageView!
    
    @IBOutlet weak var urunAciklamasi: UILabel!

    @IBOutlet weak var urunFiyatLabel: UILabel!
    
    
    @IBOutlet weak var adetLabel: UILabel!
    
    
    @IBOutlet weak var fiyatLabel: UILabel!
    var yemek : Yemekler?
    var detayPresenterNesnesi:ViewToPresenterDetayProtocol?
    let kullanici_adi = "Ekin"
    var adet=1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //stepperlabel.text = adet
        if let y=yemek{
            urunAdLabel.text = "\(y.yemek_adi!)"
            urunFiyatLabel.text = "Fiyat:"
            fiyatLabel.text = "\(y.yemek_fiyat!)₺"
            urunAciklamasi.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat. Bon Apetite."
            
        }
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek!.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                self.urunImageView.kf.setImage(with: url)
                    }
            urunImageView.layer.borderWidth = 4
            urunImageView.layer.cornerRadius = 25
            urunImageView.layer.borderColor = UIColor(named: "cellBorderColor")?.cgColor
    }

        
        DetayRouter.createModule(ref: self)
    }
    /*@IBAction func buttonStepper(_ sender: UIStepper) {
        stepperlabel.text = "\(Int(sender.value))"
        adet = stepperlabel.text!
        stepperlabel.text = adet
        
    }*/
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        dismiss(animated: true)
        if let ad=yemek?.yemek_adi, let resim_adi=yemek?.yemek_resim_adi, let fiyat=yemek?.yemek_fiyat{
            detayPresenterNesnesi?.sepeteAt(yemek_adi: ad, yemek_resim_adi: resim_adi, yemek_fiyat: fiyat, yemek_siparis_adet: String(adet), kullanici_adi: kullanici_adi)
        }
        
    }
    
    @IBAction func plusButton(_ sender: Any) {
        adet += 1
        adetLabel.text = "\(adet)"
    }
    @IBAction func minusButton(_ sender: Any) {
        if adet>1{
            adet -= 1
        }
        adetLabel.text = "\(adet)"
    }
    
}

