//
//  ModuleBuilder.swift
//  mvp
//
//  Created by Виталий on 27.02.2022.
//

import Foundation
import UIKit

protocol AsselderBuilder {
    func createMainModule ( router : RouterProtocol) -> UIViewController
    func createDetailModule (comment : Comment? ,router : RouterProtocol) -> UIViewController

}

class AsselderModuleBuilder : AsselderBuilder {
    
    
    func createMainModule(router : RouterProtocol) -> UIViewController {
       let view = MainViewController( )
       let networkService = NetworkService( )
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
       view.presenter = presenter
       return view
   }
    
    
     func createDetailModule(comment : Comment? ,router : RouterProtocol) -> UIViewController {
        let view = DetailViewController( )
        let networkService = NetworkService( )
         let presenter = DetailPresener(view: view, networkService: networkService, router: router, comment: comment)
        view.presenter = presenter
        return view
    
    }
    
     
    
    
}
