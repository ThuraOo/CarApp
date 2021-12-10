//
//  TableCell.swift
//  CarApp
//
//  Created by ThuraOo on 10/12/2021.
//

import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet weak var kmLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        kmLbl.layer.borderColor = UIColor(red: 113/255, green: 242/255, blue: 189/255, alpha: 0.5).cgColor
    }
}
