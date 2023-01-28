//
//  MovieAPIManager.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import Foundation


class MovieAPIManager{
    
    func getMarvelVsDCList(onSuccess:@escaping(MarvelDCResponse) -> Void, onFailure:@escaping(APIErrors) -> Void){
        let url = APIConstants.BaseURLs().preproductionURL + APIConstants.Endpoints.marvelVsDCList.rawValue
        APIManager().GET(requestUrl: url, resultType: MarvelDCResponse.self) { result in
            switch result {
            case .success(let returnedResponse):
                onSuccess(returnedResponse)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
}
