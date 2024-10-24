//
//  Recipe.swift
//  FoodBook
//
//  Created by Habibur Rahman on 20/10/24.
//

import Foundation

struct Recipe : Identifiable {
    
    var name : String
    var details : NSAttributedString
    var ingredients : String
    var totalTime : String
    var image : String?
    var category : String
    var id: String = UUID().uuidString
    
 
//    init(name: String, details: NSAttributedString, ingredients: String, totalTime: String, image: String, category: String, id: String) {
//        self.name = name
//        self.details = details
//        self.ingredients = ingredients
//        self.totalTime = totalTime
//        self.image = image
//        self.category = category
//        self.id = id
//    }
    
    func getFormatedDuration() -> String {
        guard let timeInInt = totalTime.toInt() else{
            return "N/A"
        }
       
        return timeInInt.toFormatedHourMinuteText()
    }
}

