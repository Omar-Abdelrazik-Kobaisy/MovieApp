//
//  MovieDetails.swift
//  swift_9_task
//
//  Created by Omar on 10/02/2023.
//

import Foundation

class Item : Decodable{
    var id : String?
    var rank : String?
    var title : String?
    var image : String?
    var weekend : String?
    var gross : String?
    var weeks : String?
}

class Data : Decodable{
    var items : [Item]
    var errorMessage : String?
}
