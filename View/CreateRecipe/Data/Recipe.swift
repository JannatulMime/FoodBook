//
//  Recipe.swift
//  FoodBook
//
//  Created by Habibur Rahman on 20/10/24.
//

import Foundation

struct Recipe {
    
    var name : String
    var details : NSAttributedString
    var ingredients : String
    var totalTime : String
    var image : String
    var category : String
    var id: String = UUID().uuidString
    
    func getFormatedDuration() -> String {
        guard let timeInInt = totalTime.toInt() else{
            return "N/A"
        }
       
        return timeInInt.toFormatedHourMinuteText()
    }
}

