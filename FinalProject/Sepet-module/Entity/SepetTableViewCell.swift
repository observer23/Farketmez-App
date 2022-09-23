//
//  SepetTableViewCell.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var urunImageView: UIImageView!
    @IBOutlet weak var urunAdLabel: UILabel!
    @IBOutlet weak var urunAdetLabel: UILabel!
    @IBOutlet weak var toplamLabel: UILabel!
    @IBOutlet weak var toplamTutarLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        toplamLabel.text = "Tutar:"
    }

    @IBAction func sepetStepper(_ sender: Any) {
        
    }
}
