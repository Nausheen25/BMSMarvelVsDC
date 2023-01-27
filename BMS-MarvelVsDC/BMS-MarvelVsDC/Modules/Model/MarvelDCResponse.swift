//
//  MarvelDCResponse.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import Foundation

struct MarvelDCResponse: Decodable{
    let marvel: [Movies]?
    let dc: [Movies]?
    
    struct Movies:Decodable{
        let name: String?
        let likeCount: Int?
        let image_url: String?
    }
}
