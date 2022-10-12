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
	
    var viewModel: CarVisualizationViewModel?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
        if let viewModel = viewModel {            
            title = viewModel.title
            labelBrand.text = viewModel.brand
            labelGasType.text = viewModel.fuel
            labelPrice.text = viewModel.price
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let carFormViewController = segue.destination as? CarFormViewController else { return }
        carFormViewController.viewModel = viewModel?.getCarFormViewModel()
	}
}
