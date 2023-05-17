//
//  Constants.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 17/05/23.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForSearchLocation(keyword: String) -> URL {
            return URL(string: "https://api.yelp.com/v3/businesses/search?\(keyword)")!
        }
        
        
        static func urlForGetID(id: String) -> URL {
            
            
            return URL(string: "https://api.yelp.com/v3/businesses/\(id)")!
        }
        
    }
    
    static let API_KEYS = "OjveWGLHeHu_uu50iyXjZ8yQhBIoNR9G2-xkY6Pz-Wzr6PfKb2T05oeSpOfqsOjbOSodM4w0T6WpeWpAT4oPo_TQEgn00QxI4Pag39atSvAPYaswMLYHYuBW70djZHYx"
    static let DefaultLocation = "NYC"
    
}
