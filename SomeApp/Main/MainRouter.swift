//
//  MainRouter.swift
//  SomeApp
//
//  Created by Олександр Палагнюк on 12.11.2020.
//

import Foundation

class MainRouter: MainRouterProtocol{
    init(viewController : MainViewController) {
        
    }
    
    func navigateToAnotherScreen() {
        //логика навигации между экранами
    }
}

protocol MainRouterProtocol : class {
    func navigateToAnotherScreen()
}
