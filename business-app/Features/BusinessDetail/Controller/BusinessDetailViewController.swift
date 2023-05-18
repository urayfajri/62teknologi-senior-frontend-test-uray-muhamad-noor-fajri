//
//  BusinessDetailViewController.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 17/05/23.
//

import UIKit

class BusinessDetailViewController: UIViewController {

    @IBOutlet weak var navigationView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var businessDetailTableView: UITableView!
    
    // MARK: VARIABLE
    var businesVM : BusinessViewModel?
    var businesReviewVM = BusinessReviewViewModel(reviews: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUINavigation()
        registerCell()
        
        if let id = businesVM?.item.id{
            getBusinessDetail(id: id)
            getBusinessReviewDetail(id: id)
        }
    }
    
    func setUINavigation(){
        navigationView.backgroundColor = UIColor.white
        navigationView.layer.shadowColor = UIColor.gray.cgColor
        navigationView.layer.shadowOffset = CGSize(width: 1, height: 1)
        navigationView.layer.shadowRadius = 1
        navigationView.layer.shadowOpacity = 5
    }
    
    func getBusinessDetail(id: String){
        businesVM?.getBusinessDetailFromID(id: id, completion: { Businesses in
            LoadingScreen.sharedInstance.showIndicator()
            DispatchQueue.main.async {
                self.businessDetailTableView.reloadData()
            }
            LoadingScreen.sharedInstance.hideIndicator()
        })
    }
    
    func getBusinessReviewDetail(id: String){
        businesReviewVM.getBusinessDetailReviewFromID(id: id, completion: { BusinessReview in
            LoadingScreen.sharedInstance.showIndicator()
            DispatchQueue.main.async {
                self.businessDetailTableView.reloadData()
            }
            LoadingScreen.sharedInstance.hideIndicator()
        })
    }
    
    func registerCell(){
        businessDetailTableView.register(UINib.init(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "headerTableViewCell")
        businessDetailTableView.register(UINib.init(nibName: "PhotoGalleryTableViewCell", bundle: nil), forCellReuseIdentifier: "photoGalleryTableViewCell")
        businessDetailTableView.register(UINib.init(nibName: "BusinessReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "businessReviewTableViewCell")
        businessDetailTableView.delegate = self
        businessDetailTableView.dataSource = self
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension BusinessDetailViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerTableViewCell", for: indexPath) as! HeaderTableViewCell
            let address = "\(businesVM?.item.location?.address1 ?? "") \(businesVM?.item.location?.city ?? "") , \(businesVM?.item.location?.state ?? "")  \(businesVM?.item.location?.zip_code ?? "")"
            cell.setupUI(name: businesVM?.item.name ?? "", displayPhone: businesVM?.item.display_phone ?? "", address: address, imageURL: URL(string: businesVM?.item.image_url ?? ""), rating: businesVM?.item.rating ?? 0, price: businesVM?.item.price ?? "-")
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "photoGalleryTableViewCell", for: indexPath) as! PhotoGalleryTableViewCell
            cell.setupUI(listPhoto: businesVM?.item.photos ?? [])
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "businessReviewTableViewCell", for: indexPath) as! BusinessReviewTableViewCell
            cell.setupUI(listReview: businesReviewVM.item)
            return cell
        default:
            return UITableViewCell()
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row{
        case 0:
            return 450
        case 1:
            return 150
        case 2 :
            return 200
        default:
            return 100
        }
        
    }
    
    
}
