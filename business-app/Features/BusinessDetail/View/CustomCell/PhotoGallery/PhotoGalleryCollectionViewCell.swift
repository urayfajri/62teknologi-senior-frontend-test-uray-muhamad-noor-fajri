//
//  PhotoGalleryCollectionViewCell.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 18/05/23.
//

import UIKit

class PhotoGalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var photoItem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resetUI()
    }
    
    func resetUI(){
        outerView.layer.cornerRadius = 10
        photoItem.layer.cornerRadius = 15
        photoItem.image = UIImage(named: "noImage")
        
    }
    
    func setupUI(imageStr : String){
        photoItem.sd_setImage(with: URL(string: imageStr), placeholderImage: UIImage(named: "noImage"))
        
    }

}
