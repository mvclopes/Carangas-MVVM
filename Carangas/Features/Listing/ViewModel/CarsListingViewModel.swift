//
//  CarsListingViewModel.swift
//  Carangas
//
//  Created by Matheus Lopes on 11/10/22.
//

import Foundation

final class CarsListingViewModel {
    
    // MARK: - Properties
    private var service = CarService()
    private var cars: [Car] = []
    
    var numberOfRows: Int { cars.count }
        
    func loadCars(onComplete: @escaping (Result<Void, CarServiceError>) -> Void) {
        service.loadCars { [weak self] result in
            switch result {
            case .success(let cars):
                self?.cars = cars
                onComplete(.success(()))
            case .failure(let apiError):
                onComplete(.failure(apiError))
            }
        }
    }
    
    func cellViewModelFor(_ indexPath: IndexPath) -> VehicleCellProtocol {
        let car = cars[indexPath.row]
        let viewModel = CarCellViewModel(car: car)
        return viewModel
    }
    
    func deleteCar(at indexPath: IndexPath, onComplete: @escaping (Result<Void, CarServiceError>) -> Void) {
        let car = cars[indexPath.row]
        service.deleteCar(car) { [weak self] result in
            switch result {
                case .success:
                    self?.cars.remove(at: indexPath.row)
                    onComplete(.success(()))
                case .failure(let apiError):
                    onComplete(.failure(apiError))
            }
        }
    }
    
    func getCarVisualizationViewModel(at indexPath: IndexPath) -> CarVisualizationViewModel {
        let car = cars[indexPath.row]
        return CarVisualizationViewModel(car: car)
    }
}
