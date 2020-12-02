//
//  MainInteractor.swift
//  SomeApp
//
//  Created by Олександр Палагнюк on 12.11.2020.
//

import Foundation

//model из ведра
class MainInteractor : MainInteractorProtocol {
    
    weak var presenter : MainPresenterProtocol!
    var restController: RestController = RestController.shared
    
    init(presenter : MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func requestEmployees() {
        restController.request(of: SomeClass.self, requestMethod: "employees") { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(emps):
                print(emps)
                self.presenter.showEmployees(employees: emps.data)
            }
        }
    }
}

struct SomeClass: Decodable {
    let data : [Employee]
}

protocol MainInteractorProtocol{
    func requestEmployees()
}
