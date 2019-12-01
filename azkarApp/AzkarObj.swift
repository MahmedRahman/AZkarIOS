//
//  AzkarObj.swift
//  azkarApp
//
//  Created by Mohamed on 11/28/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//


class AzkarCategories: Decodable {
    var Id :Int
    var CategoryId : Int?
    var CategoryName:String?
    var AzkarId : Int?
    var AzkarName : String?
}

class Azkar: Decodable {
    
    var Id:Int
    var Name:String?
    var Body:String?
    var Count:Int?
    var Approved:Int?
    var Date:String?
    var CategoryId:Int?
    var AzkarCategories:[AzkarCategories]?
    var AzkarCategoriesJson:String?
    var AzkarCategoriesId :Int?
    
   
}
