//
//  MainPresenter.swift
//  mvp
//
//  Created by Виталий on 27.02.2022.
//

import Foundation
protocol MainViewProtocol: class {
    func succes ()
    func failure( error : Error)
}

protocol MainViewPresenterProtocol : class {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol , router : RouterProtocol)
    func getComments ()
    var comments : [Comment ]? {get set}
    func tapOnTheComment (comment: Comment?)
    
}

class MainPresenter : MainViewPresenterProtocol{
    
    
    
    var comments: [Comment]?
    weak var view : MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router : RouterProtocol?
    required init(view: MainViewProtocol,  networkService: NetworkServiceProtocol , router : RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }
    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
    
    
    func getComments() {
        networkService.getDataFromJSON { [weak self] result in
            guard let self  = self else {return}
            DispatchQueue.main.async{
                switch result {
                case .success(let commets):
                    self.comments = commets
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}


