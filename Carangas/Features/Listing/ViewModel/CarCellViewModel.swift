//
//  CarCellViewModel.swift
//  Carangas
//
//  Created by Matheus Lopes on 11/10/22.
//

import Foundation

final class CarCellViewModel: VehicleCellProtocol {
    
    private var car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    var name: String { car.name }    
    var brand: String { car.brand }
    
}
