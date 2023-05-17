//
//  PhotoGalleryTableViewCell.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 18/05/23.
//

import UIKit

class PhotoGalleryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var photoGalleryCollectionView: UICollectionView!
    
    var photos: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(listPhoto : [String]){
        self.photos = listPhoto
        DispatchQueue.main.async {
            self.photoGalleryCollectionView.reloadData()
        }
    }
    
    func registerCell(){
        photoGalleryCollectionView.register(UINib.init(nibName: "PhotoGalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "photoItemCollectionViewCell")
        photoGalleryCollectionView.delegate = self
        photoGalleryCollectionView.dataSource = self
    }
    
}

extension PhotoGalleryTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "photoItemCollectionViewCell", for: indexPath) as! PhotoGalleryCollectionViewCell
        
        item.setupUI(imageStr: photos[indexPath.row])
        
        return item
    }
    
    
}

// MARK: Collection view delegate Layout
extension PhotoGalleryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var widthCell : CGSize = CGSize(width: 100, height: 100)
        
        if collectionView == self.photoGalleryCollectionView{
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 10
            layout.invalidateLayout()
            
            widthCell =  CGSize(width: (self.photoGalleryCollectionView.frame.width - 30) / 3 , height: 80) // Set your item size here
        }else{
            widthCell =  CGSize(width: 125 , height:150)
        }
        
        return widthCell
    }
}
