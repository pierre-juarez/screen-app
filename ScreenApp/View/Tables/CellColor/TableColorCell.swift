//
//  TableColorCell.swift
//  ScreenApp
//
//  Created by Jhonatan Chavez on 20/11/24.
//

import UIKit

class TableColorCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var lblColor: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Configuration cell
    func configure(cellColor: UIColor, nameColor: String){
        viewColor.backgroundColor = cellColor
        lblColor.text = nameColor
    }
}
