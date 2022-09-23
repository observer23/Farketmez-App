//
//  SiparislerVC.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import UIKit

class SiparislerVC: UIViewController{

    @IBOutlet weak var siparislerbaslikLabel: UILabel!
    @IBOutlet weak var SiparislerTableView: UITableView!
    
    

    @IBOutlet weak var deliveryImage: UIImageView!
    
    //var siparisOnayi : Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        siparislerbaslikLabel.text = "Siparislerim"
        
        SiparislerTableView.dataSource = self
        SiparislerTableView.delegate = self
        //deliveryImage.layer.cornerRadius = 25
        //print(siparisTarih!)
        
    }
    
    @IBAction func canliTakipButton(_ sender: Any) {
    }
    override func viewWillAppear(_ animated: Bool) {
        SiparislerTableView.reloadData()
    }

}
extension SiparislerVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return siparisOnay
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "siparisHucre", for: indexPath) as! SiparislerTableViewCell
        let sayi = siparisOnayListesi[indexPath.row]
        let tarih = siparisTarihi[sayi-1]
        cell.siparisNumarasiLabel.text = "  \(tarih)\n  Tarihli Siparisiniz."
        return cell
    }
    
    
    
}
