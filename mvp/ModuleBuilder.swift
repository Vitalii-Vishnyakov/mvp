//
//  ModuleBuilder.swift
//  mvp
//
//  Created by Виталий on 27.02.2022.
//

import Foundation
import UIKit

protocol Builder {
    static func createMainModule ( ) -> UIViewController
    static func createDetailModule (comment : Comment? ) -> UIViewController

}

class ModeuleBulder : Builder {
    static func createDetailModule(comment : Comment? ) -> UIViewController {
        let view = DetailViewController( )
        let networkService = NetworkService( )
        let presenter = DetailPresener(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    
    }
    
    static func createMainModule() -> UIViewController {
        let view = MainViewController( )
        let networkService = NetworkService( )
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    
}
