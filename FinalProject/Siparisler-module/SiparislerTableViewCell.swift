//
//  SiparislerTableViewCell.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 22.09.2022.
//

import UIKit

class SiparislerTableViewCell: UITableViewCell {

    @IBOutlet weak var siparisNumarasiLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func canlıTakipButton(_ sender: Any) {
    }
}
