//
//  SepetRouter.swift
//  FinalProject
//
//  Created by Ekin Atasoy on 12.09.2022.
//

import Foundation

class SepetRouter:PresenterToRouterSepetProtocol{
    static func createModules(ref: SepetVC) {
        let presenter = SepetPresenter()
        // View
        ref.sepetPresenterNesnesi = presenter
        // Presenter
        ref.sepetPresenterNesnesi?.sepetView = ref
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetInteractor()
        
        // Interactor
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter
    }
    
    
}
