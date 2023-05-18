//
//  BusinessReviewViewModel.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 18/05/23.
//

import Foundation

class BusinessReviewViewModel {

    var item: [Reviews]

    init(reviews: [Reviews]) {
        self.item = reviews
    }
    
    
    func getBusinessDetailReviewFromID(id : String, completion: @escaping ([Reviews]) -> Void) {
        
        var urlRequest = URLRequest(url:  Constants.Urls.urlForGetBusinessReview(id: id))
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(Constants.API_KEYS)",forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "GET"

        
        Webservice().loadPOST(resource: urlRequest) { (result) in            
            if let review = result {
                do{
                    let dataDecoder = try JSONDecoder().decode(ReviewResponses.self, from: review)
                    self.item = dataDecoder.reviews ?? []
                    
                   
                    completion(self.item)
                  } catch let parsingError {
                     print("Error", parsingError)
                }
            }
        }
    }
    
}
