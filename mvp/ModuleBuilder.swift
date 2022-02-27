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
}

class ModeuleBulder : Builder {
    static func createMainModule() -> UIViewController {
        let person = Person(firstName: "Vitalii", lastName:  "Vishnyakov")
        let view = MainViewController( )
        let presenter = MainPresenter(view: view, person: person)
        view.presenter = presenter
        return view
    }
    
    
}
