//
//  BusinessViewModel.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 17/05/23.
//

import Foundation
class BusinessViewModel {

    var item: Businesses

    init(business: Businesses) {
        self.item = business
    }
    
    
    func getBusinessDetailFromID(id : String, completion: @escaping (Businesses) -> Void) {
        
        var urlRequest = URLRequest(url:  Constants.Urls.urlForGetID(id: id))
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(Constants.API_KEYS)",forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "GET"

        Webservice().loadPOST(resource: urlRequest) { (result) in
            
            if let business = result {
                do{
                    let dataDecoder = try JSONDecoder().decode(Businesses.self, from: business)
                    self.item = dataDecoder
                    
                   
                    completion(self.item)
                  } catch let parsingError {
                     print("Error", parsingError)
                }
            }
        }
    }
    
}

