//
//  MainPresenter.swift
//  mvp
//
//  Created by Виталий on 27.02.2022.
//

import Foundation
protocol MainViewProtocol: class {
    func setGreeting (greeting: String)
    
}

protocol MainViewPresenterProtocol : class {
    init(view: MainViewProtocol, person : Person)
    func showGreeting ( )
}


class MainPresenter : MainViewPresenterProtocol{
    
    
    let view : MainViewProtocol
    let person : Person
    
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let str = self.person.firstName + "   " + self.person.lastName
        view.setGreeting(greeting:  str)
            
    }
    
    
}
