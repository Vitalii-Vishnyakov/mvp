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
    init(view : DetailViewProtocol, networkService : NetworkServiceProtocol , comment : Comment?)
    func setComment ()
}

class DetailPresener : DetailViewPresenterProtocol{
    var comment: Comment?
    weak var view : DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }
    
    
}
