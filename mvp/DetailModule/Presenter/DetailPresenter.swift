//
//  DetailPresenter.swift
//  mvp
//
//  Created by Виталий on 27.02.2022.
//

import Foundation
protocol DetailViewProtocol : class {
    func setComment(comment: Comment?)
    
}

protocol DetailViewPresenterProtocol : class{
    init(view : DetailViewProtocol, networkService : NetworkServiceProtocol , router:RouterProtocol,comment : Comment?)
    func setComment ()
    func tap( )
}

class DetailPresener : DetailViewPresenterProtocol{
    var comment: Comment?
    weak var view : DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router : RouterProtocol?
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol,router:RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }
    
    func tap ( ){
        router?.popToRoot()
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }
    
    
}
