//
//  CarsListingCoordinator.swift
//  Carangas
//
//  Created by Matheus Lopes on 29/10/22.
//

import UIKit

final class CarsListingCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CarsTableViewController.instantiateFrom(storyboard: .listing)
        viewController.viewModel = CarsListingViewModel(coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showCar(_ car: Car) {
        print("Carro: \(car.name)")
    }
    
    func showCarCreation() {
        print("Criando carro")
    }
}
