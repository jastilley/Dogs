//  Created by work on 26/07/2020.
//  Copyright © 2020 Olatunbosun. All rights reserved.

import Foundation

public struct DogDto: Decodable, Equatable {
   public let name: String
//   public let ingredients: [IngredientDto]
//   public let steps: [String]
//   public let timers: [Int]
//   public let imageURL: URL

    public init(name: String) {
    
//   public init(name: String, ingredients: [IngredientDto], steps: [String], timers: [Int], imageURL: URL) {
      self.name = name
//      self.ingredients = ingredients
//      self.steps = steps
//      self.timers = timers
//      self.imageURL = imageURL
   }
}

//public struct IngredientDto: Decodable, Equatable {
//   public let quantity: String
//   public let name: String
//   public let type: String
//
//   public init(quantity: String, name: String, type: String) {
//      self.quantity = quantity
//      self.name = name
//      self.type = type
//   }
//}
