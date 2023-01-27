//
//  APIManager.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import Foundation

struct APIManager{
    
    func GET<T:Decodable>(requestUrl: String,
                          resultType: T.Type,
                          queryParams: [String:String]? = nil,
                          headerType: APIHeader.HeaderType = .DEFAULT,
                          completion:@escaping(Result<T, APIErrors>) -> Void){
        
        //check for valid URL
        guard var url = URL(string: requestUrl) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        //create the request object
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = APIHeader().getHeaderData(type: headerType)
        
        URLSession.shared.dataTask(with: request) { (responseData, httpUrlResponse, error) in
            
            if error != nil {
                completion(.failure(.invalidResponse))
                return
            }
            //no response
            if responseData == nil{
                completion(.failure(.dataFailure))
            }
            
            if let responseData = responseData{
                //parse the responseData to required object
                let decoder = JSONDecoder()
                do {
                    let returnedResponse = try decoder.decode(T.self, from: responseData)
                    completion(.success(returnedResponse))
                    debugPrint("returnedResponse: \(returnedResponse)")
                } catch {
                    debugPrint(error)
                    completion(.failure(.invalidResponse))
                    return
                }
            }
        }.resume()
    }
    
}
