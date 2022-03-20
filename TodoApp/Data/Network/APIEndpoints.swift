//
//  APIEndpoints.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

struct APIEndpoints {
    
    static func getCallList() -> Endpoint<[PersonResponseDTO]> {

        return Endpoint(path: "imkhan334/demo-1/call",
                        method: .get)
    }
    
    static func getBuyList() -> Endpoint<[ItemResponseDTO]> {

        return Endpoint(path: "imkhan334/demo-1/buy",
                        method: .get)
    }

}
