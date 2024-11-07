//
//  Recipe.swift
//  FoodBook
//
//  Created by Habibur Rahman on 20/10/24.
//

import Foundation

struct Recipe: Identifiable {
    var name: String
    var details: NSAttributedString
    var ingredients: String
    var duration: String
    var image: String?
    var category: String
    var id: String = UUID().uuidString

    func getFormatedDuration() -> String {
        guard let timeInInt = duration.toInt() else {
            return "N/A"
        }

        return timeInInt.toFormatedHourMinuteText()
    }

    func getImageData() -> Data? {
        if let fileName = image {
            return LocalFileStore.getDataFrom(fileName: fileName)
        }
        return nil
    }
}
