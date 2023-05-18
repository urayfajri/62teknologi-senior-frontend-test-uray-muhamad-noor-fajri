//
//  BusinessReviewCollectionViewCell.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 18/05/23.
//

import UIKit

class BusinessReviewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var outerView: UIView!
    
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resetUI()
    }
    
    func resetUI(){
        outerView.layer.cornerRadius = 10
        userProfileImageView.layer.cornerRadius = 15
        userProfileImageView.image = UIImage(named: "noImage")
        
    }
    
    
    func setupUI(username : String, rating: Double, ratingDescription : String, imageUserProfileURL : URL?){
        
        userNameLabel.text = username
        ratingLabel.text = "Rating : \(rating)"
        ratingDescriptionLabel.text = ratingDescription
        
        guard let imageUrl = imageUserProfileURL else {return}
        print("ini gambar \(imageUrl)")
        userProfileImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "noImage"))
    }

}
