//
//  ViewController.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 17/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var emptyView: UIView!
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    @IBOutlet weak var businessListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func searchButtonPressed(_ sender: Any) {
    }
    
    @IBAction func filterButtonPressed(_ sender: Any) {
    }
}

