//
//  DetayRouter.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import Foundation

class DetayRouter:PresenterToRouterDetayProtocol{
    static func createModule(ref: DetayVC) {
        ref.detayPresenterNesnesi = DetayPresenter()
        ref.detayPresenterNesnesi?.detayInteractor = DetayInteractor()
    }
    
    
}
