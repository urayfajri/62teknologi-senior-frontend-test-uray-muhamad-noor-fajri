//
//  BusinessReviewTableViewCell.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 18/05/23.
//

import UIKit

class BusinessReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var businessReviewCollectionView: UICollectionView!
    
    var reviews: [Reviews] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(listReview : [Reviews]){
        self.reviews = listReview
        DispatchQueue.main.async {
            self.businessReviewCollectionView.reloadData()
        }
    }
    
    func registerCell(){
        businessReviewCollectionView.register(UINib.init(nibName: "BusinessReviewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "businessReviewCollectionViewCell")
        businessReviewCollectionView.delegate = self
        businessReviewCollectionView.dataSource = self
    }
    
}

extension BusinessReviewTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "businessReviewCollectionViewCell", for: indexPath) as! BusinessReviewCollectionViewCell
        
        item.setupUI(
            username: reviews[indexPath.row].user?.name ?? "-",
            rating: Double(reviews[indexPath.row].rating ?? 0),
            ratingDescription: reviews[indexPath.row].text ?? "-",
            imageUserProfileURL:  URL(string: reviews[indexPath.row].user?.profile_url ?? "")
        )
        
        return item
    }
    
    
}

// MARK: Collection view delegate Layout
extension BusinessReviewTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var widthCell : CGSize = CGSize(width: 190, height: 150)
        
        if collectionView == self.businessReviewCollectionView{
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 10
            layout.invalidateLayout()
            
            widthCell =  CGSize(width: (self.businessReviewCollectionView.frame.width - 30) / 2 , height: 150) // Set your item size here
        }else{
            widthCell =  CGSize(width: 125 , height:150)
        }
        
        return widthCell
    }
}
