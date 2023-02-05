//
//  IconModel.swift
//  Weather
//
//  Created by Marcel Camargos on 05/02/23.
//

import Foundation
import UIKit

enum IconModel {

    //MARK: Request
    ///view -> interactor

    struct Request {

    }

    //MARK: Response
    ///interactor -> presenter

    struct Response {
        let icon: UIImage
    }

    //MARK: ViewModel
    ///presenter -> view

    struct ViewModel {
        let icon: UIImage
    }
}
