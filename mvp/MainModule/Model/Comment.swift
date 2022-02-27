//
//  Person.swift
//  mvp
//
//  Created by Виталий on 27.02.2022.
//

import Foundation


struct Comment : Decodable {
    var postId : Int
    var id : Int
    var name : String
    var email : String
    var body : String
    
}
