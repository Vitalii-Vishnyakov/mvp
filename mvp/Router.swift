//
//  RouterProtocol.swift
//  mvp
//
//  Created by Виталий on 27.02.2022.
//

import Foundation
import UIKit


protocol RouterMain {
    var navigationController : UINavigationController? {get set}
    var assemblyBuilder: AsselderBuilder?{get set}
    
    
}

protocol RouterProtocol : RouterMain{
    func initialViewController( )
    func showDetail(comment : Comment?)
    func popToRoot ( )
}

class Router : RouterProtocol{
    var navigationController: UINavigationController?
    
    var assemblyBuilder: AsselderBuilder?
    
    init(navigationController: UINavigationController, assemblyBuilder: AsselderBuilder) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else {return}
            navigationController.viewControllers = [mainViewController]
            
        }
    }
    
    func showDetail(comment: Comment?) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailModule(comment: comment, router: self)else {return}
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
            
        }
    }
    
    
    
}
