//
//  MainConfigurator.swift
//  SomeApp
//
//  Created by Олександр Палагнюк on 12.11.2020.
//

import Foundation

class MainConfigurator : MainConfiguratorProtocol {
    
    func configure(with viewController : MainViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}

protocol MainConfiguratorProtocol : class {
    func configure(with viewController : MainViewController)
}
