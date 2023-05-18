//
//  HeaderTableViewCell.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 18/05/23.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var businessTitle: UILabel!
    @IBOutlet weak var businessImage: UIImageView!
    @IBOutlet weak var businessAddress: UILabel!
    @IBOutlet weak var businessPhone: UILabel!
    @IBOutlet weak var businessRating: UILabel!
    @IBOutlet weak var businessPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resetData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func resetData(){
        businessTitle.text = "Business Title"
        businessImage.image = UIImage(named: "noImage")
        businessImage.contentMode = .scaleAspectFill
        businessAddress.text = "Business Address"
        businessPhone.text = "Business Phone"
        businessRating.text = "-"
        businessPrice.text = "-"
        
    }
    
    func setupUI(name : String, displayPhone : String, address : String, imageURL : URL?, rating: Double, price: String){
        
        businessTitle.text = name
        businessImage.contentMode = .scaleAspectFill
        businessAddress.text = address
        businessPhone.text = displayPhone
        businessRating.text = "\(rating)"
        businessPrice.text = price
        
        guard let imageUrl = imageURL else {return}
        businessImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "noImage"))
        
        
        
    }
    
}
