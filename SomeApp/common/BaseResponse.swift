//
//  BaseResponse.swift
//  SomeApp
//
//  Created by Олександр Палагнюк on 13.11.2020.
//

import Foundation

public struct BaseResponse<T> {
    let status: Status
    let data: T
    let code: Int
}

public enum Status: String, Decodable {
    case success = "success"
    case error = "error"
}
