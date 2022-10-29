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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CarFormViewController.instantiateFrom(storyboard: .form)
        viewController.viewModel = CarFormViewModel(coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }
}
