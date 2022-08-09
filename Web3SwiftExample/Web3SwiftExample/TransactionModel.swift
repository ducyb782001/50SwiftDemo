//
//  TransactionModel.swift
//  Web3SwiftExample
//
//  Created by MacOS on 08/08/2022.
//

import Foundation

struct TransactionResponse: Decodable {
    let status: String?
    let message: String?
    let result: [EachTransaction]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case result = "result"
    }
}

struct EachTransaction: Decodable {
    let blockNumber: String?
    let timeStamp: String?
    let from: String?
    let to: String?
    let value: String?
    let gas: String?
    let gasPrice: String?
    
    enum CodingKeys: String, CodingKey {
        case blockNumber = "blockNumber"
        case timeStamp = "timeStamp"
        case from = "from"
        case to = "to"
        case value = "value"
        case gas = "gas"
        case gasPrice = "gasPrice"
    }
    
}
