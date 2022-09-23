//
//  ViewController.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import UIKit
import Kingfisher
class AnasayfaVC: UIViewController {
    
    var yemeklerListesi = [Yemekler]()
    var yemeklerListesiSorted = [Yemekler]()
    var baslikResimler=["intro1","intro2","intro3"]
    
    @IBOutlet weak var UrunlerCollectionView: UICollectionView!
    
    @IBOutlet weak var baslıkCollectionView: UICollectionView!
    
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tasarim=UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        tasarim.minimumLineSpacing = 5
        tasarim.minimumInteritemSpacing = 5
        let genislik = UrunlerCollectionView.frame.size.width
        let itemGenislik = (genislik-30)/2
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.25)
        
        UrunlerCollectionView.collectionViewLayout = tasarim
        UrunlerCollectionView.delegate = self
        UrunlerCollectionView.dataSource = self
        
        baslıkCollectionView.delegate = self
        baslıkCollectionView.dataSource = self
        
        AnasayfaRouter.createModule(ref: self)
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(named: "general")
        
        renkDegistir(itemApperance: appearance.stackedLayoutAppearance)
        renkDegistir(itemApperance: appearance.inlineLayoutAppearance)
        renkDegistir(itemApperance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // presenterNEsnesi. tum yemekleri yükle todo
        anasayfaPresenterNesnesi?.tumYemekleriYukle()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let yemek = sender as? Yemekler{
                let gidilecekVC = segue.destination as! DetayVC
                gidilecekVC.yemek = yemek
            }
        }
    }
    
    func renkDegistir(itemApperance:UITabBarItemAppearance){
        itemApperance.selected.iconColor = UIColor.black
        itemApperance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        itemApperance.selected.badgeBackgroundColor = UIColor.red

        itemApperance.normal.iconColor = UIColor.darkGray
        itemApperance.normal.titleTextAttributes = [.foregroundColor: UIColor.darkGray]
        itemApperance.normal.badgeBackgroundColor = UIColor.red
        
    }
    
    
}
extension AnasayfaVC:PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListesi = yemeklerListesi
        DispatchQueue.main.async {
            self.UrunlerCollectionView.reloadData()
        }
        
    }
    
    
}
extension AnasayfaVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.UrunlerCollectionView {
            return yemeklerListesi.count
        }
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.UrunlerCollectionView {
            let yemek = yemeklerListesi[indexPath.row]
            
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "urunHucre", for: indexPath) as! UrunlerCollectionViewCell
            
            
            cell.urunAdLabel.text = "\(yemek.yemek_adi!)"
            //print("\(yemek.yemek_adi ?? "Yemek yok")")
            //cell.urunImageView.image = kingfisher resim ekleme
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"){
                DispatchQueue.main.async {
                    //self.u.kf.setImage(with: url)
                    cell.urunImageView.kf.setImage(with: url)
                }
                
            }
            //cell.backgroundColor = UIColor(named: "cellBackgroundColor")
            cell.layer.borderWidth = 0
            cell.layer.borderColor = UIColor(named: "cellBorderColor")?.cgColor
            //cell.layer.cornerRadius = 5
            cell.urunImageView.layer.borderWidth = 1
            cell.urunImageView.layer.borderColor = UIColor(named: "cellBorderColor")?.cgColor
            cell.urunImageView.layer.cornerRadius = 25
            
            cell.urunAdLabel.layer.cornerRadius = 10
            
            
            return cell
        }
        
        else {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "baslikHucre", for: indexPath) as! BaslikViewCell
            cellB.baslikResimImage.image = UIImage(named: baslikResimler[indexPath.row])
            
            return cellB
        }
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.UrunlerCollectionView {
            let yemek = yemeklerListesi[indexPath.row]
            performSegue(withIdentifier: "toDetay", sender: yemek)
        }else{
            print("BAslık tıklandı.")
        }
    }
}


