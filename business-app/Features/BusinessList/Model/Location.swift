//
//  Location.swift
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
struct Location : Codable {
    let address1 : String?
    let address2 : String?
    let address3 : String?
    let city : String?
    let zip_code : String?
    let country : String?
    let state : String?
    let display_address : [String]?

    enum CodingKeys: String, CodingKey {

        case address1 = "address1"
        case address2 = "address2"
        case address3 = "address3"
        case city = "city"
        case zip_code = "zip_code"
        case country = "country"
        case state = "state"
        case display_address = "display_address"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address1 = try values.decodeIfPresent(String.self, forKey: .address1)
        address2 = try values.decodeIfPresent(String.self, forKey: .address2)
        address3 = try values.decodeIfPresent(String.self, forKey: .address3)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        zip_code = try values.decodeIfPresent(String.self, forKey: .zip_code)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        display_address = try values.decodeIfPresent([String].self, forKey: .display_address)
    }

}

