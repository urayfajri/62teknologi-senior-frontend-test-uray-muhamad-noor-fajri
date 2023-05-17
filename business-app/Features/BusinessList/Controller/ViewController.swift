//
//  ViewController.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 17/05/23.
//

import Foundation
import UIKit

enum SortingValue: String,CaseIterable{
    case bestMatch = "best_match"
    case review = "review_count"
    case rating = "rating"
    case distance = "distance"
}

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var emptyView: UIView!
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    @IBOutlet weak var businessListTableView: UITableView!
    
    
    // MARK: Variable
    var listBusinessVM = BusinessListViewModel()
    var selectedIndex : Int = 0
    var selectedBusinessVM : BusinessViewModel?
    var isLoading = false
    var searchType : String = ""
    var keyword = "location=NYC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setUINavigation()
        registerCell()
        getBusiness(keyword: self.keyword,isNext: false) // just set default
    }
    
    func setUINavigation(){
        navigationView.backgroundColor = UIColor.white
        navigationView.layer.shadowColor = UIColor.red.cgColor
        navigationView.layer.shadowOffset = CGSize(width: 1, height: 1)
        navigationView.layer.shadowRadius = 1
        navigationView.layer.shadowOpacity = 5
        emptyView.isHidden = true
    }
    
    func registerCell(){
        businessListTableView.register(UINib.init(nibName: "BusinessListTableViewCell", bundle: nil), forCellReuseIdentifier: "listBusinessTableViewCell")
        businessListTableView.delegate = self
        businessListTableView.dataSource = self
        
    }
    
    func checkState(){
        if(listBusinessVM.numberOfRows(0) == 0){
            emptyView.isHidden = false
            businessListTableView.isHidden = true
        }else{
            emptyView.isHidden = true
            businessListTableView.isHidden = false
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToDetail"{
//            guard let newVC = segue.destination as? BusinessDetailViewController else {
//               return
//            }
//
//            newVC.businesVM = self.selectedBusinessVM
//
//
//        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

    @IBAction func searchButtonPressed(_ sender: Any) {
        let slideVC = OverlaySearchView()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        slideVC.delegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    
    @IBAction func filterButtonPressed(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Sort By", message: "", preferredStyle: .actionSheet)
//        actionSheet.view.tintColor = Uicolor
        
        let sortByBestMatch = UIAlertAction(title: "Best Match", style: .default){ (action: UIAlertAction) in
            self.keyword += "&sort_by=\(SortingValue.bestMatch.rawValue)"
            self.getBusiness(keyword: self.keyword, isNext: false)
        }
        let sortByRating = UIAlertAction(title: "Rating", style: .default){ (action: UIAlertAction) in
            
            self.keyword += "&sort_by=\(SortingValue.rating.rawValue)"
            self.getBusiness(keyword: self.keyword, isNext: false)
        }
        let sortByReview = UIAlertAction(title: "Review", style: .default){ (action: UIAlertAction) in
            self.keyword += "&sort_by=\(SortingValue.review.rawValue)"
            self.getBusiness(keyword: self.keyword, isNext: false)
        }
        let sortByDistance = UIAlertAction(title: "Distance", style: .default){ (action: UIAlertAction) in
            self.keyword += "&sort_by=\(SortingValue.distance.rawValue)"
            self.getBusiness(keyword: self.keyword, isNext: false)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style:.cancel, handler: nil)
        
        
        actionSheet.addAction(sortByBestMatch)
        actionSheet.addAction(sortByRating)
        actionSheet.addAction(sortByDistance)
        actionSheet.addAction(sortByReview)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true, completion: nil)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationSearchTypeViewController(presentedViewController: presented, presenting: presenting)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBusinessVM.numberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listBusinessTableViewCell", for: indexPath) as! BusinessListTableViewCell
        
        let data = listBusinessVM.modelAt(indexPath.row)
        let address = "\(data.item.location?.address1 ?? "") \(data.item.location?.city ?? "") , \(data.item.location?.state ?? "")  \(data.item.location?.zip_code ?? "")"
        cell.setupUI(name: data.item.name ?? "", phone: data.item.phone ?? "", price: data.item.price ?? "", rating: data.item.rating ?? 0, address: address  , imageURL: (URL(string: data.item.image_url ?? "")))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        selectedBusinessVM = listBusinessVM.modelAt(indexPath.row)
        //self.performSegue(withIdentifier: "goToDetail", sender: ViewController.self)
    }
    
    
    //API doesn't have unlimited page
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row == listBusinessVM.numberOfRows(0) - 4 && !isLoading && listBusinessVM.numberOfRows(0) >= 10{
//            isLoading = true
//
//            getBusiness(keyword: self.keyword, isNext: true)
//
//
//        }
//    }
    
}

// MARK: GET DATA
extension ViewController{
    func getBusiness(keyword: String, isNext : Bool){
        isLoading = true
        LoadingScreen.sharedInstance.showIndicator()
        listBusinessVM.getBusinessFromKeyword(keyword: keyword,isNext: isNext) { _ in
           
            DispatchQueue.main.async {
                self.businessListTableView.reloadData()
                self.checkState()
                self.isLoading = false
                LoadingScreen.sharedInstance.hideIndicator()

            }
        }
    }
}

extension ViewController : OverlayDoneProtocol{
    func delegateAndSearch(searchTerm: String) {
        self.keyword = searchTerm
        getBusiness(keyword: searchTerm, isNext: false)
    }
    
    
}
