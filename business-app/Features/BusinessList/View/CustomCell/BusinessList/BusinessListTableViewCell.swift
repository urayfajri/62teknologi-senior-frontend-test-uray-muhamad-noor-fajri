//
//  BusinessListTableViewCell.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 17/05/23.
//

import UIKit
import SDWebImage

class BusinessListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var BusinessImageView: UIImageView!
    
    @IBOutlet weak var BusinessAddressLabel: UILabel!
    @IBOutlet weak var BusinessNameLabel: UILabel!
    @IBOutlet weak var BusinessPhoneLabel: UILabel!
    @IBOutlet weak var BusinessPriceLabel: UILabel!
    @IBOutlet weak var BusinessRatingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func resetUI(){
        BusinessImageView.image = UIImage(named: "noImage")
        BusinessNameLabel.text = "Business Name : "
        BusinessPhoneLabel.text = "Business Phone : "
        BusinessPriceLabel.text = "Price : "
        BusinessRatingLabel.text = "Business Rating : "
        BusinessAddressLabel.text = "Business Address : "
    }
    
    func setupUI(name : String, phone : String, price: String, rating: Double, address : String, imageURL : URL?){
        
        BusinessNameLabel.text = "Business Name : \(name)"
        BusinessPhoneLabel.text = "Business Phone : \(phone)"
        BusinessPriceLabel.text = "Price : \(price)"
        BusinessRatingLabel.text = "Business Rating : \(rating)"
        BusinessAddressLabel.text = "Business Address : \(address)"
        
        guard let imageUrl = imageURL else {return}
        BusinessImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "noImage"))
    }
    
}
