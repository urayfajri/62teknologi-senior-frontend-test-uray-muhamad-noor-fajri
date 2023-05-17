//
//  WebService.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 17/05/23.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class Webservice {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let error = error {
              print("Error accessing API: \(error)")
              return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                     completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
            
        }.resume()
        
    }
    
    func loadPOST(resource: URLRequest,completion: @escaping (Foundation.Data?) -> ()) {
      URLSession.shared.dataTask(with: resource) { data, response, error in
          
          if let error = error {
            print("Error accessing API: \(error)")
            return
          }
          
        if let data = data {
          DispatchQueue.main.async {
            completion(data)
          }
        } else {
          completion(nil)
        }
      }.resume()
    }
    
}
