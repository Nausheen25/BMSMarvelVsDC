//
//  APIHeader.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import Foundation

class APIHeader {
    enum HeaderType {
        case DEFAULT
    }
    
    func getHeaderData(type:HeaderType) -> [String:String] {
        switch type {
        case .DEFAULT:
            return getDefaultHeader()
        }
    }
    
    private func getDefaultHeader() -> [String:String] {
        var header : [String:String] = [:]
        return header
    }
}
