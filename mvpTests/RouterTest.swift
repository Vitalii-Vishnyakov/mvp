//
//  RouterTest.swift
//  mvpTests
//
//  Created by Виталий on 27.02.2022.
//

import XCTest
@testable import mvp


class MockNavigatinController : UINavigationController{
    var presentedVC : UIViewController?
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: true)
    }
    
}

class RouterTest: XCTestCase {
    
    var router : RouterProtocol!
    var navigationController = MockNavigatinController( )

    override func setUp()  {
        let assembly = AsselderModuleBuilder( )
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDown()  {
        router = nil
        
    }
    
    func testRouter( ){
        router.showDetail(comment: nil)
        let detailViewConroller = navigationController.presentedVC
        
        XCTAssertTrue(detailViewConroller is DetailViewController)
    }

    

}
