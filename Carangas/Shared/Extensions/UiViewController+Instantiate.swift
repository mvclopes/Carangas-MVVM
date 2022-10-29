//
//  UiViewController+Instantiate.swift
//  Carangas
//
//  Created by Matheus Lopes on 29/10/22.
//

import Foundation
import UIKit

extension UIViewController {
    static func instantiateFrom(storyboard: UIStoryboard) -> Self {
        let name = String(describing: self)    
        return storyboard.instantiateViewController(withIdentifier: name) as! Self
    }
}
