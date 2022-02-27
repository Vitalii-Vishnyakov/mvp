//
//  mvpTests.swift
//  mvpTests
//
//  Created by Виталий on 27.02.2022.
//

import XCTest
@testable  import mvp

class MockView : MainViewProtocol {
    var titleTest : String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

class mvpTests: XCTestCase {
    
    
    var view : MockView!
    var person: Person!
    var presenter : MainPresenter!
    
    override func setUp()  {
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
        
        
    }

    override func tearDown()  {
        view = nil
        person = nil
        presenter = nil
    }
    
    func testModuleIsNotNil(){
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(person, "view is not nil")
        XCTAssertNotNil(presenter, "view is not nil")
    }
    
    func testView (){
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }
    
    func testPersonModel(){
        XCTAssertEqual(person.firstName, "Baz")
    }

    

    

}
