//
//  Service.swift
//  Web3SwiftExample
//
//  Created by MacOS on 07/08/2022.
//

import Foundation
import Alamofire

struct Request {
    private var baseURL = ""
    private var endPointURL = ""
    
    // MARK: - fetch generic data
    func testGeneric <T: Decodable> (_ urlAPI: String, completion: @escaping (T) -> ()){
        AF.request(self.baseURL + urlAPI, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response{ (responseData) in
            print("We got the generic response")
            guard let data = responseData.data else {return}
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(obj)
            } catch {
                print("Failed to decode json \(error)")
            }
            print("Run here")
        }
    }
}
