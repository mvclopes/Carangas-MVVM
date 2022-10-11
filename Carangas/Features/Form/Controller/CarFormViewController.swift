//
//  CarFormViewController.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 21/06/22.
//

import UIKit

final class CarFormViewController: UIViewController {
	
	@IBOutlet weak var textFieldBrand: UITextField!
	@IBOutlet weak var textFieldName: UITextField!
	@IBOutlet weak var textFieldPrice: UITextField!
	@IBOutlet weak var segmentedControlGasType: UISegmentedControl!
	@IBOutlet weak var buttonSave: UIButton!
	
	var car: Car?
	private let service = CarService()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if let car = car {
			title = "Atualização"
			textFieldBrand.text = car.brand
			textFieldName.text = car.name
			textFieldPrice.text = "\(car.price)"
			segmentedControlGasType.selectedSegmentIndex = car.gasType
			buttonSave.setTitle("Atualizar", for: .normal)
		}
	}
	
	@IBAction func save(_ sender: UIButton) {
		let car = car ?? Car()
		
		car.name = textFieldName.text!
		car.brand = textFieldBrand.text!
		car.price = Int(textFieldPrice.text!) ?? 0
		car.gasType = segmentedControlGasType.selectedSegmentIndex
		
		if car._id == nil {
			service.createCar(car) { [weak self] result in
				self?.showResult(result)
			}
		} else {
			service.updateCar(car) { [weak self] result in
				self?.showResult(result)
			}
		}
	}
	
	private func showResult(_ result: Result<Void, CarServiceError>) {
		switch result {
		case .success:
			DispatchQueue.main.async {
				self.navigationController?.popViewController(animated: true)
			}
		case .failure(let apiError):
			print(apiError.errorMessage)
		}
	}
}
