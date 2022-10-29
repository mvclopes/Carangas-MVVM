//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Matheus Lopes on 29/10/22.
//

import UIKit

final class CarFormCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    private var car: Car?
    
    init(navigationController: UINavigationController, car: Car? = nil) {
        self.navigationController = navigationController
        self.car = car
    }
    
    func start() {
        let viewController = CarFormViewController.instantiateFrom(storyboard: .form)
        viewController.viewModel = CarFormViewModel(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}
