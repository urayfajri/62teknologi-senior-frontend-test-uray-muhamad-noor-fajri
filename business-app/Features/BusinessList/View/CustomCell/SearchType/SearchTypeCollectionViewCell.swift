//
//  SearchTypeCollectionViewCell.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 17/05/23.
//

import UIKit

class SearchTypeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var searchTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func resetUI(){
        outerView.layer.cornerRadius = 10
        outerView.backgroundColor = UIColor.lightGray
        outerView.layer.borderColor = UIColor.clear.cgColor
        outerView.layer.borderWidth = 2
    }
    
    func setupUI(type : String){
        searchTypeLabel.text = type
        self.isSelected = false
        backgroundUpdate()
        
    }
    
    func backgroundUpdate(){
        if(isSelected){
            self.outerView.backgroundColor = UIColor.red
            self.tintColor = UIColor.white
        }else{
            self.outerView.backgroundColor = UIColor.lightGray
            self.tintColor = UIColor.black
        }
    }

}
