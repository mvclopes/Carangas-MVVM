//
//  CarViewController.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 21/06/22.
//

import UIKit

final class CarViewController: UIViewController {
	
	@IBOutlet weak var labelBrand: UILabel!
	@IBOutlet weak var labelGasType: UILabel!
	@IBOutlet weak var labelPrice: UILabel!
	
	var car: Car?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		if let car = car {
			title = car.name
			labelBrand.text = "Marca: \(car.brand)"
			labelGasType.text = "Combustível: \(car.fuel)"
			labelPrice.text = "Preço: R$ \(car.price),00"
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let vc = segue.destination as? CarFormViewController else { return }
		vc.car = car
	}
}
