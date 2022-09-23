//
//  HakkimizdaVC.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import UIKit
import MapKit
class HakkimizdaVC: UIViewController {
    
    @IBOutlet weak var hakkimizdaBaslikLabel: UILabel!
    
    @IBOutlet weak var konumMapKit: MKMapView!
    @IBOutlet weak var hakkimizdaBilgiLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hakkimizdaBaslikLabel.text = "Hakkımızda"
        hakkimizdaBilgiLabel.text = "Şirketimiz henüz kurulum aşamasında.\nBizi İzmir'de bulabilirsiniz.\n \nİletişim:\nekinemreatasoy@gmail.com "
        
        let location = CLLocationCoordinate2D(latitude: 38.429017, longitude: 27.134355)
        konumMapKit.setCenter(location, animated: true)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let bolge = MKCoordinateRegion(center: location, span: span)
        konumMapKit.setRegion(bolge, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = location
        pin.title = "Burdayız."
        konumMapKit.addAnnotation(pin)
        

    }
    
    
    
    
}
