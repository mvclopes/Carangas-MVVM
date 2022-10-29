//
//  CarVisualizationCoordinator.swift
//  Carangas
//
//  Created by Matheus Lopes on 29/10/22.
//

import UIKit

final class CarVisualizationCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    private let car: Car
    
    init(navigationController: UINavigationController, car: Car) {
        self.navigationController = navigationController
        self.car = car
    }
    
    func start() {
        let viewController = CarViewController.instantiateFrom(storyboard: .visualization)
        viewController.viewModel = CarVisualizationViewModel(car: car, coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func editCar(_ car: Car) {
        let childCoordinator = CarFormCoordinator(navigationController: navigationController, car: car)
        add(childCoordinator: childCoordinator)
        childCoordinator.parentCoordinator = self
        childCoordinator.start()
    }
}
