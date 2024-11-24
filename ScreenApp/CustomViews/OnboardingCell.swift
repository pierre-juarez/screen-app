//
//  OnboardingCell.swift
//  ScreenApp
//
//  Created by Jhonatan Chavez on 18/11/24.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imgCustom: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var widthCustomImage: NSLayoutConstraint!
    
    func configure(item: OnboardingItem){
        widthCustomImage.constant = normalize(value: 260)
        imgCustom.image = item.img
        lblTitle.text = item.title
        lblSubtitle.text = item.subtitle
    }
    
    func normalize(value: CGFloat) -> CGFloat {
        let scale = UIScreen.main.bounds.width / 375.0
        return value * scale
    }
    
}
