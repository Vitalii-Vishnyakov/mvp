//
//  mvpTests.swift
//  mvpTests
//
//  Created by Виталий on 27.02.2022.
//

import XCTest
@testable  import mvp

class MockView : MainViewProtocol {
    func succes() {
        
    }
    
    func failure(error: Error) {
        
    }
    
    
}

class MockNetworkService : NetworkServiceProtocol{
    var comments : [Comment]!
    
    init( ){}
    
    convenience init (comments : [Comment]){
        self.init()
        self.comments = comments
    }
    
    func getDataFromJSON(complition: @escaping (Result<[Comment]?, Error>) -> Void) {
        if let comments = comments{
            complition( .success(comments))
        }else{
            let error = NSError(domain: "", code: 0, userInfo: nil)
            complition(.failure(error))
        }
    }
    
    
}

class mvpTests: XCTestCase {
    
    var view : MockView!
    var presenter : MainPresenter!
    var networkService : NetworkServiceProtocol!
    var router : RouterProtocol!
    var comments  = [Comment]( )
 
    
    override func setUp()  {
        let nav = UINavigationController( )
        let assembly = AsselderModuleBuilder( )
        router = Router(navigationController: nav, assemblyBuilder: assembly)
        
    }

    override func tearDown()  {
        view = nil
        networkService = nil
        presenter = nil
    }
    
    func testGetSuccesComents(){
        let comment = Comment(postId: 1, id: 1, name: "foo", email: "Baz", body: "Bar")
        comments.append(comment)
        view = MockView( )
        networkService = MockNetworkService(comments: comments)
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchComments : [Comment]?
        
        networkService.getDataFromJSON { result in
            switch result {
            case .success(let comments):
                catchComments = comments
            case .failure(let error):
                print(error )
            
            }
        }
        XCTAssertNotEqual(catchComments?.count, 0)
        XCTAssertEqual(catchComments?.count, comments.count)
    }
    
    func testGetFailureComents(){
        let comment = Comment(postId: 1, id: 1, name: "foo", email: "Baz", body: "Bar")
        comments.append(comment)
        view = MockView( )
        networkService = MockNetworkService()
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchError: Error?
        
        networkService.getDataFromJSON { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                catchError = error
            }
        }
       XCTAssertNotNil(catchError)
    }
    
    

}
