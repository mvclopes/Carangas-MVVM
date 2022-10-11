//
//  CarsTableViewController.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 21/06/22.
//

import UIKit

final class CarsTableViewController: UITableViewController {
	
	// MARK: - Properties
	private let label: UILabel = {
		let label = UILabel(frame: .zero)
		label.text = "Sem carros cadastrados"
		label.textAlignment = .center
		label.font = UIFont.italicSystemFont(ofSize: 16.0)
		return label
	}()
	private var service = CarService()
	private var cars: [Car] = []
	
	// MARK: - Super Methods
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		loadCars()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let vc = segue.destination as? CarViewController,
			  let row = tableView.indexPathForSelectedRow?.row else { return }
		
		vc.car = cars[row]
	}
	
	private func loadCars() {
		service.loadCars { [weak self] result in  //<- //Captiure List
			switch result {
			case .success(let cars):
				self?.cars = cars
				DispatchQueue.main.async {
					self?.tableView.reloadData()
				}
			case .failure(let apiError):
				print(apiError.errorMessage)
			}
		}
	}
	
	// MARK: - Table view data source
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let count = cars.count
		tableView.backgroundView = count == 0 ? label : nil
		return count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		let car = cars[indexPath.row]
		cell.textLabel?.text = car.name
		cell.detailTextLabel?.text = car.brand
		return cell
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			let car = cars[indexPath.row]
			service.deleteCar(car) { [weak self] result in
				switch result {
					case .success:
						self?.cars.remove(at: indexPath.row)
						DispatchQueue.main.async {
							self?.tableView.deleteRows(at: [indexPath], with: .automatic)
						}
					case .failure(let apiError):
						print(apiError.errorMessage)
				}
			}
		}
	}
}
