//
//  APIConstants.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import Foundation


struct APIConstants{
    
    struct BaseURLs {
        let preproductionURL = "https://demo2782755.mockable.io/"
        let productionURL = "https://demo2782755.mockable.io/"
    }
    
    enum Endpoints: String{
        case marvelVsDCList = "superheroes"
        case movieDetails = "movie/{movie_id}"
    }
}


enum APIErrors: String, Error {
    case invalidUrl = "Invalid Url"
    case dataFailure = "Invalid Data"
    case invalidResponse = "Something went wrong! Error in parsing data"
    case unknownIssue = "Something went wrong!! Please try after some time"
    case internetNotAvailable = "Your internet connection seems to be super slow, bouncy or dead. Check your connection and try again"
    case none
}

