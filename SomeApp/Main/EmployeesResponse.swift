//
//  EmployeesResponse.swift
//  SomeApp
//
//  Created by Олександр Палагнюк on 13.11.2020.
//

import Foundation

struct EmployessResponse: Decodable {
    let status : Status?
    let data : [Employee]
    
}

struct Employee: Decodable {
    let id : Int
    let employee_name : String
    let employee_salary : Int
    let employee_age : Int
    let profile_image : String
}

enum EmployeeResponseError : Error {
    case error
}
