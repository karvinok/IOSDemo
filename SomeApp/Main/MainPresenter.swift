//
//  MainPresenter.swift
//  SomeApp
//
//  Created by Олександр Палагнюк on 12.11.2020.
//

import Foundation

//viewModel из ведра
class MainPresenter : MainPresenterProtocol {

    var interactor        : MainInteractorProtocol!
    var router            : MainRouterProtocol!
    var view              : MainViewControllerProtocol!

    init(view : MainViewControllerProtocol) {
        self.view = view
        
        print("inited presenter")
    }
    
    func requestEmployees() {
        interactor.requestEmployees()
    }
    
    func showEmployees(employees emps: [Employee]) {
        view.showEmployees(employees: emps)
    }
}

protocol MainPresenterProtocol : class {
    var router: MainRouterProtocol! { set get }
    func requestEmployees()
    func showEmployees(employees: [Employee])
}
