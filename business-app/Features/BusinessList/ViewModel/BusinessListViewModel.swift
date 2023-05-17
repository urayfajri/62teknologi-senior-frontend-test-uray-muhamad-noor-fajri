//
//  BusinessListViewModel.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 17/05/23.
//

import Foundation
class BusinessListViewModel{
    private var listBusinessResponse = [BusinessViewModel]()
    private var page : Int = 1

    
    func numberOfRows(_ section: Int) -> Int {
        return listBusinessResponse.count
    }
    
    func modelAt(_ index: Int) -> BusinessViewModel {
        return listBusinessResponse[index]
    }
    
    
    func getBusinessFromKeyword(keyword : String,isNext: Bool, completion: @escaping ([BusinessViewModel]) -> Void) {
        
        if(listBusinessResponse.count > 0 && !isNext){
            listBusinessResponse = []
        }
        
        
        var urlRequest = URLRequest(url:  Constants.Urls.urlForSearchLocation(keyword: keyword))
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(Constants.API_KEYS)",forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "GET"

        Webservice().loadPOST(resource: urlRequest) { (result) in
            
            if let business = result {
                do{
                    let dataDecoder = try JSONDecoder().decode(BusinessResponses.self, from: business)
                    
                    if let businessResponses = dataDecoder.businesses{
                        for business in businessResponses{
                            self.listBusinessResponse.append(BusinessViewModel(business: business))
                        }
                    }
                   
                    completion(self.listBusinessResponse)
                  } catch let parsingError {
                     print("Error", parsingError)
                }
            }
        }
    }
    
    
}

