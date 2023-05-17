//
//  Businesses.swift
//  business-app
//
//  Created by Uray Muhamad Noor Fajri Widiansyah on 17/05/23.
//

/*
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Businesses : Codable {
    let id : String?
    let alias : String?
    let name : String?
    let image_url : String?
    let is_closed : Bool?
    let url : String?
    let review_count : Int?
    let categories : [Categories]?
    let rating : Double?
    let coordinates : Coordinates?
    let transactions : [String]?
    let price : String?
    let location : Location?
    let phone : String?
    let display_phone : String?
    let distance : Double?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case alias = "alias"
        case name = "name"
        case image_url = "image_url"
        case is_closed = "is_closed"
        case url = "url"
        case review_count = "review_count"
        case categories = "categories"
        case rating = "rating"
        case coordinates = "coordinates"
        case transactions = "transactions"
        case price = "price"
        case location = "location"
        case phone = "phone"
        case display_phone = "display_phone"
        case distance = "distance"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        alias = try values.decodeIfPresent(String.self, forKey: .alias)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
        is_closed = try values.decodeIfPresent(Bool.self, forKey: .is_closed)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        review_count = try values.decodeIfPresent(Int.self, forKey: .review_count)
        categories = try values.decodeIfPresent([Categories].self, forKey: .categories)
        rating = try values.decodeIfPresent(Double.self, forKey: .rating)
        coordinates = try values.decodeIfPresent(Coordinates.self, forKey: .coordinates)
        transactions = try values.decodeIfPresent([String].self, forKey: .transactions)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        display_phone = try values.decodeIfPresent(String.self, forKey: .display_phone)
        distance = try values.decodeIfPresent(Double.self, forKey: .distance)
    }

}

