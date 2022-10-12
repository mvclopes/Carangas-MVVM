//
//  CarVisualizationViewModel.swift
//  Carangas
//
//  Created by Matheus Lopes on 11/10/22.
//

import Foundation

final class CarVisualizationViewModel {
    
    private var car: Car
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()
    
    var title: String { car.name }
    var brand: String { "Marca: \(car.brand)" }
    var fuel: String { "Combustível: \(car.fuel)" }
    var price: String {
        let price = numberFormatter.string(from: NSNumber(value: car.price)) ?? "R$ \(car.price),00"
        return "Preço: \(price)"
    }
    
    init(car: Car) {
        self.car = car
    }
}
